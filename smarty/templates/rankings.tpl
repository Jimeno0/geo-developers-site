<!DOCTYPE HTML>
<html>
<head>
    <link href='http://fonts.googleapis.com/css?family=Roboto:400,300' rel='stylesheet' type='text/css'>
    {include file="header.tpl" title="Ranking de profesionales GIS - Geo Developers"}
    <meta name="description" content="Conoce a los profesionales GIS más recomendados, con más conocimientos o más activos del panorama hispano-hablante." />
</head>
<body id="rankings">
{include file="menu.tpl"}
<div id="main-wrapper">
    <div class="container">
        <div class="row">
            <div class="col-md-12" style="margin-bottom:20px;">
                <a href="../../">Home</a> &gt; <a href="{$ROOT}members">Miembros</a> &gt; Rankings
            </div>
        </div>

        <div id="content">
            <ul id="tabs" class="tabs nav nav-tabs" data-tabs="tabs">
                <li class="active"><a href="#members" data-toggle="tab"><i class="fa fa-users"></i> Miembros</a></li>
                <li><a href="#tech" data-toggle="tab"><i class="fa fa-cogs"></i> Tecnologías</a></li>
            </ul>
            <div id="ranking-content" class="tab-content clearfix">
                <div class="tab-pane active" id="members">
                    <div class="col-md-4">
                        <div class="panel panel-default">
                            <div class="panel-heading text-center">Top {$NTOPRECOMMENDED} - Recomendados <i class="fa fa-info-circle" data-toggle="tooltip" data-placement="top" title="Este listado muestra los miembros que más recomendaciones han recibido por parte de otros miembros"></i> </div>
                            <table class="table text-center">
                                <thead>
                                <tr>
                                    <th class="text-center">#</th>
                                    <th>GeoDeveloper</th>
                                    <th class="text-center"><i class="fa fa-thumbs-o-up"></i></th>
                                </tr>
                                </thead>
                                <tbody>
                                {for $I=0 to $NTOPRECOMMENDED-1}
                                    <tr>
                                        <td>{$I+1}</td>
                                        <td class="text-left">
                                            <a href="{$ROOT}members/{$TOPRECOMMENDED[$I]["meetup_id"]}" class="capitalize">
                                                <div class="image-wrapper">
                                                    <div class="picture" style="background-image: url('{$TOPRECOMMENDED[$I]["photo_url"]}')"></div>
                                                </div>
                                                {$TOPRECOMMENDED[$I]["name"]}</a>
                                        </td>
                                        <td>{$TOPRECOMMENDED[$I]["count"]}</td>
                                    </tr>
                                {/for}
                                </tbody>
                            </table>
                        </div>
                    </div>

                    <div class="col-md-4">
                        <div class="panel panel-default">
                            <div class="panel-heading text-center">Top 20 - Giseros <i class="fa fa-info-circle" data-toggle="tooltip" data-placement="top" title="Miembros con más conocimientos o intereses GIS"></i> </div>
                            <table class="table text-center">
                                <thead>
                                <tr>
                                    <th class="text-center">#</th>
                                    <th class="text-left">GeoDeveloper</th>
                                    <th class="text-center"><i class="fa fa-map-o"></i></th>
                                </tr>
                                </thead>
                                <tbody>
                                {for $I=0 to $NTOPGISEROS-1}
                                    <tr>
                                        <td>{$I+1}</td>
                                        <td class="text-left">
                                            <a href="{$ROOT}members/{$TOPGISEROS[$I]["meetup_id"]}" class="capitalize">
                                                <div class="image-wrapper">
                                                    <div class="picture" style="background-image: url('{$TOPGISEROS[$I]["photo_url"]}')"></div>
                                                </div>
                                                {$TOPGISEROS[$I]["name"]}</a>
                                        </td>
                                        <td>{$TOPGISEROS[$I]["count"]}</td>
                                    </tr>
                                {/for}
                                </tbody>
                            </table>
                        </div>
                    </div>

                    <div class="col-md-4">
                        <div class="panel panel-default">
                            <div class="panel-heading text-center">Top 20 - Curiosos <i class="fa fa-info-circle"  data-toggle="tooltip" data-placement="top" title="Miembros con más conocimientos o intereses GIS y no GIS"></i> </div>
                            <table class="table text-center">
                                <thead>
                                <tr>
                                    <th class="text-center">#</th>
                                    <th class="text-left">GeoDeveloper</th>
                                    <th class="text-center"><i class="fa fa-graduation-cap"></i></th>
                                </tr>
                                </thead>
                                <tbody>
                                {for $I=0 to $NTOPEXPERTS-1}
                                    <tr>
                                        <td>{$I+1}</td>
                                        <td class="text-left">
                                            <a href="{$ROOT}members/{$TOPEXPERTS[$I]["meetup_id"]}" class="capitalize">
                                                <div class="image-wrapper">
                                                    <div class="picture" style="background-image: url('{$TOPEXPERTS[$I]["photo_url"]}')"></div>
                                                </div>
                                                {$TOPEXPERTS[$I]["name"]}
                                            </a>
                                        </td>
                                        <td>{$TOPEXPERTS[$I]["count"]}</td>
                                    </tr>
                                {/for}
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="tab-pane" id="tech">



                    <div class="col-md-offset-1 col-md-4">
                        <div class="panel panel-default">
                            <div class="panel-heading text-center">Top 20 - GIS <i class="fa fa-map-o"></i> </div>
                            <table class="table text-center">
                                <thead>
                                <tr>
                                    <th>#</th>
                                    <th class="text-left">Tecnología</th>
                                    <th class="text-center"><i class="fa fa fa-users"></i></th>
                                </tr>
                                </thead>
                                <tbody>
                                {for $I=0 to $NTOPGIS-1}
                                    <tr>
                                        <td>{$I+1}</td>
                                        <td class="text-left">
                                            <a  href="../?tech={$TOPGIS[$I]["name"]}"
                                                data-toggle="tooltip" data-placement="bottom" title="{$TOPGIS[$I]["desc"]}">
                                                {$TOPGIS[$I]["name"]}
                                            </a>
                                        </td>
                                        <td>{$TOPGIS[$I]["count"]}</td>
                                    </tr>
                                {/for}
                                </tbody>
                            </table>
                        </div>
                    </div>


                    <div class="col-md-offset-1 col-md-4">
                        <div class="panel panel-default">
                            <div class="panel-heading text-center">Top 20 - Otras <i class="fa fa-globe"></i> </div>
                            <table class="table text-center">
                                <thead>
                                <tr>
                                    <th>#</th>
                                    <th class="text-left">Tecnología</th>
                                    <th class="text-center"><i class="fa fa fa-users"></i></th>
                                </tr>
                                </thead>
                                <tbody>
                                {for $I=0 to $NTOPOTHERS-1}
                                    <tr>
                                        <td>{$I+1}</td>
                                        <td class="text-left"><a href="../?tech={$TOPOTHERS[$I]["name"]}">{$TOPOTHERS[$I]["name"]}</a></td>
                                        <td>{$TOPOTHERS[$I]["count"]}</td>
                                    </tr>
                                {/for}
                                </tbody>
                            </table>
                        </div>
                    </div>


                </div>

            </div>

        </div>

    </div>
    {include file="footer.tpl"}
    <script>
        require([
            'jquery',
            'resources'
        ],function($, resources){
            resources.init();
        });
    </script>

</body>
</html>