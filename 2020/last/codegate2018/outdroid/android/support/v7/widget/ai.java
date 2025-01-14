package android.support.v7.widget;

import android.content.Context;
import android.os.Build.VERSION;
import android.support.v4.i.t;
import android.support.v4.widget.g;
import android.support.v7.a.a.a;
import android.view.MotionEvent;
import android.view.View;

class ai extends aq {
    private boolean g;
    private boolean h;
    private boolean i;
    private t j;
    private g k;

    public ai(Context context, boolean z) {
        super(context, null, a.dropDownListViewStyle);
        this.h = z;
        setCacheColorHint(0);
    }

    private void a(View view, int i) {
        performItemClick(view, i, getItemIdAtPosition(i));
    }

    private void a(View view, int i, float f, float f2) {
        this.i = true;
        if (VERSION.SDK_INT >= 21) {
            drawableHotspotChanged(f, f2);
        }
        if (!isPressed()) {
            setPressed(true);
        }
        layoutChildren();
        if (this.f != -1) {
            View childAt = getChildAt(this.f - getFirstVisiblePosition());
            if (!(childAt == null || childAt == view || !childAt.isPressed())) {
                childAt.setPressed(false);
            }
        }
        this.f = i;
        float left = f - ((float) view.getLeft());
        float top = f2 - ((float) view.getTop());
        if (VERSION.SDK_INT >= 21) {
            view.drawableHotspotChanged(left, top);
        }
        if (!view.isPressed()) {
            view.setPressed(true);
        }
        a(i, view, f, f2);
        setSelectorEnabled(false);
        refreshDrawableState();
    }

    private void d() {
        this.i = false;
        setPressed(false);
        drawableStateChanged();
        View childAt = getChildAt(this.f - getFirstVisiblePosition());
        if (childAt != null) {
            childAt.setPressed(false);
        }
        if (this.j != null) {
            this.j.b();
            this.j = null;
        }
    }

    protected boolean a() {
        return this.i || super.a();
    }

    public boolean a(MotionEvent motionEvent, int i) {
        boolean z;
        boolean z2;
        int actionMasked = motionEvent.getActionMasked();
        switch (actionMasked) {
            case 1:
                z = false;
                break;
            case 2:
                z = true;
                break;
            case 3:
                z = false;
                z2 = false;
                break;
            default:
                z = false;
                z2 = true;
                break;
        }
        int findPointerIndex = motionEvent.findPointerIndex(i);
        if (findPointerIndex < 0) {
            z = false;
            z2 = false;
        } else {
            int x = (int) motionEvent.getX(findPointerIndex);
            findPointerIndex = (int) motionEvent.getY(findPointerIndex);
            int pointToPosition = pointToPosition(x, findPointerIndex);
            if (pointToPosition == -1) {
                z2 = z;
                z = true;
            } else {
                View childAt = getChildAt(pointToPosition - getFirstVisiblePosition());
                a(childAt, pointToPosition, (float) x, (float) findPointerIndex);
                if (actionMasked == 1) {
                    a(childAt, pointToPosition);
                }
                z = false;
                z2 = true;
            }
        }
        if (!z2 || r0) {
            d();
        }
        if (z2) {
            if (this.k == null) {
                this.k = new g(this);
            }
            this.k.a(true);
            this.k.onTouch(this, motionEvent);
        } else if (this.k != null) {
            this.k.a(false);
        }
        return z2;
    }

    public boolean hasFocus() {
        return this.h || super.hasFocus();
    }

    public boolean hasWindowFocus() {
        return this.h || super.hasWindowFocus();
    }

    public boolean isFocused() {
        return this.h || super.isFocused();
    }

    public boolean isInTouchMode() {
        return (this.h && this.g) || super.isInTouchMode();
    }

    void setListSelectionHidden(boolean z) {
        this.g = z;
    }
}
