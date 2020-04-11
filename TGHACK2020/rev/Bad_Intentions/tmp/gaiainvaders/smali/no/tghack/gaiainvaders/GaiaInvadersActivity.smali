.class public final Lno/tghack/gaiainvaders/GaiaInvadersActivity;
.super Landroidx/appcompat/app/AppCompatActivity;
.source "GaiaInvadersActivity.kt"


# annotations
.annotation runtime Lkotlin/Metadata;
    bv = {
        0x1,
        0x0,
        0x3
    }
    d1 = {
        "\u0000 \n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\u0018\u00002\u00020\u0001B\u0005\u00a2\u0006\u0002\u0010\u0002J\u0012\u0010\u0005\u001a\u00020\u00062\u0008\u0010\u0007\u001a\u0004\u0018\u00010\u0008H\u0014J\u0008\u0010\t\u001a\u00020\u0006H\u0014J\u0008\u0010\n\u001a\u00020\u0006H\u0014R\u0010\u0010\u0003\u001a\u0004\u0018\u00010\u0004X\u0082\u000e\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u000b"
    }
    d2 = {
        "Lno/tghack/gaiainvaders/GaiaInvadersActivity;",
        "Landroidx/appcompat/app/AppCompatActivity;",
        "()V",
        "gaiaInvadersView",
        "Lno/tghack/gaiainvaders/GaiaInvadersView;",
        "onCreate",
        "",
        "savedInstanceState",
        "Landroid/os/Bundle;",
        "onPause",
        "onResume",
        "app_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x1,
        0x10
    }
.end annotation


# instance fields
.field private _$_findViewCache:Ljava/util/HashMap;

.field private gaiaInvadersView:Lno/tghack/gaiainvaders/GaiaInvadersView;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 7
    invoke-direct {p0}, Landroidx/appcompat/app/AppCompatActivity;-><init>()V

    return-void
.end method


# virtual methods
.method public _$_clearFindViewByIdCache()V
    .locals 1

    iget-object v0, p0, Lno/tghack/gaiainvaders/GaiaInvadersActivity;->_$_findViewCache:Ljava/util/HashMap;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/util/HashMap;->clear()V

    :cond_0
    return-void
.end method

.method public _$_findCachedViewById(I)Landroid/view/View;
    .locals 2

    iget-object v0, p0, Lno/tghack/gaiainvaders/GaiaInvadersActivity;->_$_findViewCache:Ljava/util/HashMap;

    if-nez v0, :cond_0

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lno/tghack/gaiainvaders/GaiaInvadersActivity;->_$_findViewCache:Ljava/util/HashMap;

    :cond_0
    iget-object v0, p0, Lno/tghack/gaiainvaders/GaiaInvadersActivity;->_$_findViewCache:Ljava/util/HashMap;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    if-nez v0, :cond_1

    invoke-virtual {p0, p1}, Landroidx/fragment/app/FragmentActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iget-object v1, p0, Lno/tghack/gaiainvaders/GaiaInvadersActivity;->_$_findViewCache:Ljava/util/HashMap;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {v1, p1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_1
    return-object v0
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 2

    .line 15
    invoke-super {p0, p1}, Landroidx/appcompat/app/AppCompatActivity;->onCreate(Landroid/os/Bundle;)V

    .line 18
    invoke-virtual {p0}, Lno/tghack/gaiainvaders/GaiaInvadersActivity;->getWindowManager()Landroid/view/WindowManager;

    move-result-object p1

    const-string v0, "windowManager"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkExpressionValueIsNotNull(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-interface {p1}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object p1

    .line 19
    new-instance v0, Landroid/graphics/Point;

    invoke-direct {v0}, Landroid/graphics/Point;-><init>()V

    .line 20
    invoke-virtual {p1, v0}, Landroid/view/Display;->getSize(Landroid/graphics/Point;)V

    .line 22
    new-instance p1, Lno/tghack/gaiainvaders/GaiaInvadersView;

    move-object v1, p0

    check-cast v1, Landroid/content/Context;

    invoke-direct {p1, v1, v0}, Lno/tghack/gaiainvaders/GaiaInvadersView;-><init>(Landroid/content/Context;Landroid/graphics/Point;)V

    iput-object p1, p0, Lno/tghack/gaiainvaders/GaiaInvadersActivity;->gaiaInvadersView:Lno/tghack/gaiainvaders/GaiaInvadersView;

    .line 23
    iget-object p1, p0, Lno/tghack/gaiainvaders/GaiaInvadersActivity;->gaiaInvadersView:Lno/tghack/gaiainvaders/GaiaInvadersView;

    check-cast p1, Landroid/view/View;

    invoke-virtual {p0, p1}, Lno/tghack/gaiainvaders/GaiaInvadersActivity;->setContentView(Landroid/view/View;)V

    return-void
.end method

.method protected onPause()V
    .locals 1

    .line 35
    invoke-super {p0}, Landroidx/appcompat/app/AppCompatActivity;->onPause()V

    .line 37
    iget-object v0, p0, Lno/tghack/gaiainvaders/GaiaInvadersActivity;->gaiaInvadersView:Lno/tghack/gaiainvaders/GaiaInvadersView;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lno/tghack/gaiainvaders/GaiaInvadersView;->pause()V

    :cond_0
    return-void
.end method

.method protected onResume()V
    .locals 1

    .line 28
    invoke-super {p0}, Landroidx/appcompat/app/AppCompatActivity;->onResume()V

    .line 30
    iget-object v0, p0, Lno/tghack/gaiainvaders/GaiaInvadersActivity;->gaiaInvadersView:Lno/tghack/gaiainvaders/GaiaInvadersView;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lno/tghack/gaiainvaders/GaiaInvadersView;->resume()V

    :cond_0
    return-void
.end method
