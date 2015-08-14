{if isset($MESSAGE)}
    {$MESSAGE}
{/if}
<form action="{$ROOT}miembros/{$PROFILE["meetup_id"]}/editar" method="post" enctype="multipart/form-data">
    <div class="row">
        <div class="col-md-12">
            <div class="row">
                <div class="col-md-12">
                    <h1>Edición de perfil</h1>
                </div>
            </div>
            <p class="row">
                <span class="text-label col-md-3 pt05">Nombre:</span>
                <span class="col-md-9 pt05">
                    <input class="form-control" value="{$PROFILE["name"]}" name="name">
                </span>
            </p>
            <p class="row">
                <span class="text-label col-md-3 pt05">Apellidos:</span>
                <span class="col-md-9 pt05">
                    <input class="form-control" value="{$PROFILE["last_name"]}" name="last_name">
                </span>
            </p>
            <p class="row">
                <span class="text-label col-md-3 pt05">Foto:</span>
                <span class="col-md-9 pt05">
                    <input type="file" id="exampleInputFile" name="photo">
                    <small class="help-block">
                        <span id="picture"><img src="{$PROFILE["photo_url"]}"></span>
                        Si seleccionas un archivo reemplazarás <a href="{$PROFILE["photo_url"]}">tu foto actual</a>.
                    </small>
                </span>
            </p>
            <p class="row">
                <span class="text-label col-md-3 pt05">Ubicación:</span>
                <span class="col-md-9 pt05">
                    <input class="form-control" value="{$PROFILE["location"]}" name="location">
                    <small class="help-block">
                        Es probable que en un futuro integremos un buscador de profesionales
                        por localización, por lo que cuanto más preciso seas,más preciso será
                        el resultado.
                    </small>
                </span>
            </p>
            <p class="row">
                <span class="text-label col-md-3 pt05">Bio:</span>
                <span class="col-md-9 pt05">
                    <textarea class="form-control" name="bio">{$PROFILE["bio"]}</textarea>
                </span>
            </p>
            <p class="row">
                <span class="text-label col-md-3 pt05">Profesión:</span>
                <span class="col-md-9 pt05">{$PROFILE["occupation"]|default:'Desconocida'}</span>
            </p>
            <p class="row">
                <span class="text-label col-md-3 pt05">Cargo:</span>
                <span class="col-md-9 pt05">{$PROFILE["position"]|default:'Desconocido'}</span>
            </p>
            <p class="row">
                <span class="text-label col-md-3 pt05">Estudios:</span>
                <span class="col-md-9 pt05">{$PROFILE["studies"]|default:'Desconocidos'}</span>
            </p>
            <div class="row">
                <span class="text-label col-md-3 pt05">Perfiles sociales:</span>
                <ul class="inline col-md-9 pt05" id="social-networks">
                    {if $PROFILE["twitter_url"]}
                        <li>
                            <a href='{$PROFILE["twitter_url"]}' class="icon twitter" title="{$PROFILE["twitter_name"]}" data-toggle="tooltip" data-placement="bottom">
                                <i class="fa fa-twitter"></i>
                                <span class="label">Twitter</span>
                            </a>
                        </li>
                    {/if}
                    {if $PROFILE["linkedin_url"]}
                        <li>
                            <a href='{$PROFILE["linkedin_url"]}' class="icon linkedin" title="Linkedin" data-toggle="tooltip" data-placement="bottom">
                                <i class="fa fa-linkedin"></i>
                                <span class="label">Linkedin</span>
                            </a>
                        </li>
                    {/if}
                    {if $PROFILE["github_url"]}
                        <li>
                            <a href='{$PROFILE["github_url"]}' class="icon github" title="Github" data-toggle="tooltip" data-placement="bottom">
                                <i class="fa fa-github"></i>
                                <span class="label">Github</span>
                            </a>
                        </li>
                    {/if}
                    {if $PROFILE["meetup_url"]}
                        <li>

                            <a href='{$PROFILE["meetup_url"]}' class="icon meetup" title="Meetup" data-toggle="tooltip" data-placement="bottom">
                                <i class="fa fa-users"></i>
                                <span class="label">Meetup</span>
                            </a>
                        </li>
                    {/if}
                    {if $PROFILE["facebook_url"]}
                        <li>
                            <a href='{$PROFILE["facebook_url"]}' class="icon facebook" title="Facebook" data-toggle="tooltip" data-placement="bottom">
                                <i class="fa fa-facebook"></i>
                                <span class="label">Facebook</span>
                            </a>
                        </li>
                    {/if}
                    {if $PROFILE["flickr_url"]}
                        <li>
                            <a href='{$PROFILE["flickr_url"]}' class="icon flickr" title="Flickr" data-toggle="tooltip" data-placement="bottom">
                                <i class="fa fa-flickr"></i>
                                <span class="label">Flickr</span>
                            </a>
                        </li>
                    {/if}
                </ul>
            </div>
        </div>
    </div>
    <button type="submit" class="btn btn-default">Guardar</button>

    <hr class="clearfix mt1">

    <h2>Conocimientos e intereses:</h2>
    <p class="strong mt2 uppercase">Relacionados con el GeoDesarrollo:</p>
    {if $SKILLSGIS|@count == 0}
        <p>No se ha especificado ninguno</p>
    {else}
        <ul class="row skills">
            {for $I=0 to $SKILLSGIS|@count -1}
                <li class="col-md-4">
                    <div class="truncate" >
                        <a href="{$ROOT}miembros/?tech={$SKILLSGIS[$I]["name"]}" data-toggle="tooltip" data-placement="right" title="{$SKILLSGIS[$I]["desc"]}">
                            {$SKILLSGIS[$I]["name"]}
                        </a>
                    </div>
                    <div class="progress">
                        <div class="progress-bar" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100"
                             style="
                             {if $SKILLSGIS[$I]["level"] == 0 } width: 10%;{/if}
                             {if $SKILLSGIS[$I]["level"] == 1 } width: 25%;{/if}
                             {if $SKILLSGIS[$I]["level"] == 2 } width: 50%;{/if}
                             {if $SKILLSGIS[$I]["level"] == 3 } width: 75%;{/if}
                             {if $SKILLSGIS[$I]["level"] == 4 } width: 100%;{/if}
                                     "
                                >
                            {if $SKILLSGIS[$I]["level"] == 0 } ?{/if}
                            {if $SKILLSGIS[$I]["level"] == 1 } Básico{/if}
                            {if $SKILLSGIS[$I]["level"] == 2 } Medio{/if}
                            {if $SKILLSGIS[$I]["level"] == 3 } Avanzado{/if}
                            {if $SKILLSGIS[$I]["level"] == 4 } Experto{/if}
                        </div>
                    </div>
                </li>
            {/for}
        </ul>
    {/if}

    <hr>

    <p class="strong mt2 uppercase">Otros:</p>
    <ul class="row">
        {if $SKILLS|@count == 0}
            <p>No se ha especificado ninguno</p>
        {else}
            {for $I=0 to $SKILLS|@count -1}
                <li class="col-md-4">
                    <a class="truncate" title="{$SKILLS[$I]["name"]}"
                       href="{$ROOT}miembros/?tech={$SKILLS[$I]["name"]}">
                        {$SKILLS[$I]["name"]}
                    </a>
                    <div class="progress">
                        <div class="progress-bar" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100"
                             style="
                             {if $SKILLS[$I]["level"] == 0 } width: 10%;{/if}
                             {if $SKILLS[$I]["level"] == 1 } width: 25%;{/if}
                             {if $SKILLS[$I]["level"] == 2 } width: 50%;{/if}
                             {if $SKILLS[$I]["level"] == 3 } width: 75%;{/if}
                             {if $SKILLS[$I]["level"] == 4 } width: 100%;{/if}
                                     "
                                >
                            {if $SKILLS[$I]["level"] == 0 } ?{/if}
                            {if $SKILLS[$I]["level"] == 1 } Básico{/if}
                            {if $SKILLS[$I]["level"] == 2 } Medio{/if}
                            {if $SKILLS[$I]["level"] == 3 } Avanzado{/if}
                            {if $SKILLS[$I]["level"] == 4 } Experto{/if}
                        </div>
                    </div>
                </li>
            {/for}
        {/if}
    </ul>
</form>