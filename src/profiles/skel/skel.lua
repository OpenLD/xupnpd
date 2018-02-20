-- Copyright (C) 2011-2012 Anton Burdinuk
-- clark15b@gmail.com
-- https://tsdemuxer.googlecode.com/svn/trunk/xupnpd

-- skeleton

profiles['Skeleton']=
{
    -- comment this for enable
    ['disabled']=true,

    -- device description
    ['desc']='Skeleton for example',

    -- function which identifies device by User-Agent HTTP header (must return true or false)
    ['match']=function(user_agent)
                if string.find(user_agent,'User-Agent of Device',1,true) then
                    return true
                else
                    return false
                end
            end,

    -- any option from 'cfg' namespace, cfg.dlna_headers for example; expect description in '-- options for profiles' of xupnpd_main.lua
    ['options']=
    {
        ['dev_desc_xml']='/dev.xml',                            -- UPnP Device Description XML (/dev.xml, /wmc.xml)
        ['upnp_container']='object.container',                  -- UPnP class for containers (object.container, object.container.storageFolder)
        ['upnp_artist']=false,                                  -- send <upnp:artist> / <upnp:actor> in SOAP response
        ['upnp_feature_list']='',                               -- X_GetFeatureList response body (XML)
        ['upnp_albumart']=0,                                    -- 0: <upnp:albumArtURI>direct url</upnp:albumArtURI>, 1: <res>direct url<res>, 2: <upnp:albumArtURI>local url</upnp:
        ['dlna_headers']=true,                                  -- send TransferMode.DLNA.ORG and ContentFeatures.DLNA.ORG in HTTP response
        ['dlna_extras']=true,                                   -- DLNA extras in headers and SOAP
        ['cfg.content_disp']=true,                             -- send Content-Disposition when streaming
        ['soap_length']=true,                                   -- send Content-Length in SOAP response
        ['cfg.wdtv']=true,                                     -- WDTV Live compatible mode
        ['cfg.sec_extras']=true                                -- Samsung extras
--      ...
    },

    -- replace mime={} or join with mime_types={}
    ['replace_mime_types']=true

    -- any exist in mime={} or new file type, expect xupnpd_mime.lua
    ['mime_types']=
    {
        ['avi']    = { upnp_type.video, upnp_class.video, 'video/avi',       upnp_proto.avi,   dlna_org_extras.divx5 },
        ['asf']    = { upnp_type.video, upnp_class.video, 'video/x-ms-asf',  upnp_proto.asf,   dlna_org_extras.asf_mpeg4_sp }
        ['wmv']    = { upnp_type.video, upnp_class.video, 'video/x-ms-wmv',  upnp_proto.wmv,   dlna_org_extras.wmv_med_full },
        ['mp4']    = { upnp_type.video, upnp_class.video, 'video/mp4',       upnp_proto.mp4,   dlna_org_extras.none },
        ['mpeg']   = { upnp_type.video, upnp_class.video, 'video/mpeg',      upnp_proto.mpeg,  dlna_org_extras.mpeg_ps_pal },        -- video/x-mpeg
        ['mpeg_ts']= { upnp_type.video, upnp_class.video, 'video/mpeg',      upnp_proto.mpeg,  dlna_org_extras.mpeg_ts_sd },         -- for Sharp
        ['mpeg1']  = { upnp_type.video, upnp_class.video, 'video/mpeg',      upnp_proto.mpeg,  dlna_org_extras.mpeg1 },
        ['mpeg2']  = { upnp_type.video, upnp_class.video, 'video/mpeg2',     upnp_proto.mpeg2, dlna_org_extras.mpeg_ps_pal },
        ['ts']     = { upnp_type.video, upnp_class.video, 'video/mp2t',      upnp_proto.mp2t,  dlna_org_extras.mpeg_ts_hd },
        ['mp2t']   = { upnp_type.video, upnp_class.video, 'video/mp2t',      upnp_proto.mp2t,  dlna_org_extras.mpeg_ts_hd },
        ['mp2p']   = { upnp_type.video, upnp_class.video, 'video/mp2p',      upnp_proto.mp2p,  dlna_org_extras.mpeg_ps_pal },
        ['mov']    = { upnp_type.video, upnp_class.video, 'video/quicktime', upnp_proto.mov,   dlna_org_extras.none },
        ['mkv']    = { upnp_type.video, upnp_class.video, 'video/x-mkv',     upnp_proto.mkv,   dlna_org_extras.none },               -- video/x-matroska
        ['3gp']    = { upnp_type.video, upnp_class.video, 'video/3gpp',      upnp_proto['3gp'],dlna_org_extras.none },
        ['flv']    = { upnp_type.video, upnp_class.video, 'video/x-flv',     upnp_proto.flv,   dlna_org_extras.none },
        ['aac']    = { upnp_type.audio, upnp_class.audio, 'audio/x-aac',     upnp_proto.aac,   dlna_org_extras.none },
        ['ac3']    = { upnp_type.audio, upnp_class.audio, 'audio/x-ac3',     upnp_proto.ac3,   dlna_org_extras.ac3 },
        ['mp3']    = { upnp_type.audio, upnp_class.audio, 'audio/mpeg',      upnp_proto.mp3,   dlna_org_extras.mp3 },
        ['ogg']    = { upnp_type.audio, upnp_class.audio, 'application/ogg', upnp_proto.ogg,   dlna_org_extras.none },
        ['wma']    = { upnp_type.audio, upnp_class.audio, 'audio/x-ms-wma',  upnp_proto.wma,   dlna_org_extras.wma_full }
}
--      ...
    }
}

