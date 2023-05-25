<?php

namespace App\Http\Controllers\Admin;

use App\Models\Permission;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Http\Requests\StorePermissionRequest;
use App\Http\Requests\UpdatePermissionRequest;
use Illuminate\Support\Facades\Gate;
use Illuminate\Http\Response;

class PermissionController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        abort_if(Gate::denies('permissions_access'), Response::HTTP_FORBIDDEN, 'Forbidden');

        $permissions = Permission::paginate()->appends($request->query());;
        return view('admin.permissions.index',compact('permissions'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        abort_if(Gate::denies('permission_create'), Response::HTTP_FORBIDDEN, 'Forbidden');

        return view('admin.permissions.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(StorePermissionRequest $request)
    {
        if(isset($request->mod)){
        $access=Permission::create($request->validated());
        $access->name=$request->name."_access";
        $access->save();

        $edit=Permission::create($request->validated());
        $edit->name=$request->name."_edit";
        $edit->save();

        $delete=Permission::create($request->validated());
        $delete->name=$request->name."_delete";
        $delete->save();

        $create=Permission::create($request->validated());
        $create->name=$request->name."_create";
        $create->save();

        $show=Permission::create($request->validated());
        $show->name=$request->name."_show";
        $show->save();

            

        }else{
            
        Permission::create($request->validated());
        }
        return redirect()->route('admin.permissions.index')->with('status-success','New Permission Created');
    }


    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Permission  $permission
     * @return \Illuminate\Http\Response
     */
    public function edit(Permission $permission)
    {
        abort_if(Gate::denies('permission_edit'), Response::HTTP_FORBIDDEN, 'Forbidden');

        return view('admin.permissions.edit', compact('permission'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Permission  $permission
     * @return \Illuminate\Http\Response
     */
    public function update(UpdatePermissionRequest $request, Permission $permission)
    {
        $permission->update($request->validated());
       

        return redirect()->route('admin.permissions.index')->with('status-success','Permission Updated');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Permission  $permission
     * @return \Illuminate\Http\Response
     */
    public function destroy(Permission $permission)
    {
        abort_if(Gate::denies('permission_delete'), Response::HTTP_FORBIDDEN, 'Forbidden');

        $permission->delete();

        return redirect()->back()->with('status-success','Permission Deleted');
    }
}
