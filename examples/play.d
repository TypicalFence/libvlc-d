import core.stdc.stdlib;
import std.string;
import core.thread;
import vlc;

void main(string[] args) {
     libvlc_instance_t *inst;
     libvlc_media_player_t *mp;
     libvlc_media_t *m;
     
     /* Load the VLC engine */
     inst = libvlc_new(0, null);
  
     /* Create a new item */
     m = libvlc_media_new_location(inst, toStringz(args[1]));
        
     /* Create a media player playing environement */
     mp = libvlc_media_player_new_from_media(m);
     
     /* No need to keep the media now */
     libvlc_media_release(m);
 
     /* play the media_player */
     libvlc_media_player_play(mp);
    
     Thread.sleep(dur!("msecs")(30000));
    
     /* Stop playing */
     libvlc_media_player_stop(mp);
 
     /* Free the media_player */
     libvlc_media_player_release(mp);
 
     libvlc_release(inst);
}
