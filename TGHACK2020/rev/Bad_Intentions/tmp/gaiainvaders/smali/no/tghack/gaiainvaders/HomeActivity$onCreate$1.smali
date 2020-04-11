.class final Lno/tghack/gaiainvaders/HomeActivity$onCreate$1;
.super Ljava/lang/Object;
.source "HomeActivity.kt"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lno/tghack/gaiainvaders/HomeActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = null
.end annotation

.annotation runtime Lkotlin/Metadata;
    bv = {
        0x1,
        0x0,
        0x3
    }
    d1 = {
        "\u0000\u0010\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\u0010\u0000\u001a\u00020\u00012\u000e\u0010\u0002\u001a\n \u0004*\u0004\u0018\u00010\u00030\u0003H\n\u00a2\u0006\u0002\u0008\u0005"
    }
    d2 = {
        "<anonymous>",
        "",
        "it",
        "Landroid/view/View;",
        "kotlin.jvm.PlatformType",
        "onClick"
    }
    k = 0x3
    mv = {
        0x1,
        0x1,
        0x10
    }
.end annotation


# instance fields
.field final synthetic this$0:Lno/tghack/gaiainvaders/HomeActivity;


# direct methods
.method constructor <init>(Lno/tghack/gaiainvaders/HomeActivity;)V
    .locals 0

    iput-object p1, p0, Lno/tghack/gaiainvaders/HomeActivity$onCreate$1;->this$0:Lno/tghack/gaiainvaders/HomeActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    .line 17
    new-instance p1, Landroid/content/Intent;

    iget-object v0, p0, Lno/tghack/gaiainvaders/HomeActivity$onCreate$1;->this$0:Lno/tghack/gaiainvaders/HomeActivity;

    check-cast v0, Landroid/content/Context;

    const-class v1, Lno/tghack/gaiainvaders/GaiaInvadersActivity;

    invoke-direct {p1, v0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 18
    iget-object v0, p0, Lno/tghack/gaiainvaders/HomeActivity$onCreate$1;->this$0:Lno/tghack/gaiainvaders/HomeActivity;

    invoke-virtual {v0, p1}, Lno/tghack/gaiainvaders/HomeActivity;->startActivity(Landroid/content/Intent;)V

    return-void
.end method
