package android.support.v4.i;

import android.graphics.Rect;
import android.os.Build.VERSION;
import android.view.Gravity;

public final class d {
    public static int a(int i, int i2) {
        return VERSION.SDK_INT >= 17 ? Gravity.getAbsoluteGravity(i, i2) : -8388609 & i;
    }

    public static void a(int i, int i2, int i3, Rect rect, Rect rect2, int i4) {
        if (VERSION.SDK_INT >= 17) {
            Gravity.apply(i, i2, i3, rect, rect2, i4);
        } else {
            Gravity.apply(i, i2, i3, rect, rect2);
        }
    }
}
