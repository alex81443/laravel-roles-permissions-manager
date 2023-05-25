<?php

namespace App\Http\Controllers\Admin;
use App\Http\Controllers\Controller;
use App\Models\ConektaModel;
use Conekta\Customer;
use Conekta\CustomerTest;
use Conekta\Order;
use Illuminate\Http\Request;

class PasarelasController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }
    public function conekta()
    {   $conekta=ConektaModel::find(1);       
        return view('admin.pasarelas.conekta',compact('conekta'));
    }

    public function checkoutRedirect(){
        \Conekta\Conekta::setApiKey(getApisConekta()['private']);
        \Conekta\Conekta::setApiVersion("2.0.0");

        $validCustomer = [
        'name' => "Payment Link Name",
        'email' => "juan.perez@dominio.com"
        ];
        $customer = Customer::create($validCustomer);
        //se crea el customer
        //dd($customer);

        $validOrderWithCheckout = array(
            'line_items'=> array(
              array(
                'name'=> 'Box of Cohiba S1s',
                'description'=> 'Imported From Mex.',
                'unit_price'=> 120000,
                'quantity'=> 1,
                'sku'=> 'cohbs1',
                'category'=> 'food',
                'tags' => array('food', 'mexican food')
              )
            ),
            'checkout' => array(
              'allowed_payment_methods' => array("cash", "card", "bank_transfer"),
              'type' => 'HostedPayment',
              'success_url' => 'https://www.mysite.com/payment/confirmation',
              'failure_url' => 'https://www.mysite.com/payment/failure',
              'monthly_installments_enabled' => true,
              'monthly_installments_options' => array(3, 6, 9, 12),
              "redirection_time"=> 4 //Tiempo de Redirección al Success/Failure URL, umbrales de 4 a 20 seg.
            ),
            'customer_info' => array(
              'customer_id'   =>  'cus_2s3PBXbTfPejBsAuj'
            ),
            'currency'    => 'mxn',
            'metadata'    => array('test' => 'extra info')
          );
          $order = Order::create($validOrderWithCheckout);
          dump($order->checkout->url);
          dd($order);
          //header("Location: {$order->checkout->url}");
        }
        
}
