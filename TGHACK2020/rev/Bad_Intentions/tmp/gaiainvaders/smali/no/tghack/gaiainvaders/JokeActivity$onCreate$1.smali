.class final Lno/tghack/gaiainvaders/JokeActivity$onCreate$1;
.super Ljava/lang/Object;
.source "JokeActivity.kt"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lno/tghack/gaiainvaders/JokeActivity;->onCreate(Landroid/os/Bundle;)V
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
.field final synthetic $answer:Landroid/widget/TextView;

.field final synthetic this$0:Lno/tghack/gaiainvaders/JokeActivity;


# direct methods
.method constructor <init>(Lno/tghack/gaiainvaders/JokeActivity;Landroid/widget/TextView;)V
    .locals 0

    iput-object p1, p0, Lno/tghack/gaiainvaders/JokeActivity$onCreate$1;->this$0:Lno/tghack/gaiainvaders/JokeActivity;

    iput-object p2, p0, Lno/tghack/gaiainvaders/JokeActivity$onCreate$1;->$answer:Landroid/widget/TextView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 3

    .line 29
    iget-object p1, p0, Lno/tghack/gaiainvaders/JokeActivity$onCreate$1;->this$0:Lno/tghack/gaiainvaders/JokeActivity;

    invoke-static {p1}, Lno/tghack/gaiainvaders/JokeActivity;->access$getKey$p(Lno/tghack/gaiainvaders/JokeActivity;)Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lno/tghack/gaiainvaders/JokeActivity$onCreate$1;->$answer:Landroid/widget/TextView;

    const-string v2, "answer"

    invoke-static {v1, v2}, Lkotlin/jvm/internal/Intrinsics;->checkExpressionValueIsNotNull(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-static {p1, v0, v1}, Lno/tghack/gaiainvaders/JokeActivity;->access$decryptAnswer(Lno/tghack/gaiainvaders/JokeActivity;Ljava/lang/String;Landroid/widget/TextView;)V

    .line 30
    iget-object p1, p0, Lno/tghack/gaiainvaders/JokeActivity$onCreate$1;->this$0:Lno/tghack/gaiainvaders/JokeActivity;

    iget-object v0, p0, Lno/tghack/gaiainvaders/JokeActivity$onCreate$1;->$answer:Landroid/widget/TextView;

    invoke-static {v0, v2}, Lkotlin/jvm/internal/Intrinsics;->checkExpressionValueIsNotNull(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v0, Landroid/view/View;

    invoke-static {p1, v0}, Lno/tghack/gaiainvaders/JokeActivity;->access$showHide(Lno/tghack/gaiainvaders/JokeActivity;Landroid/view/View;)V

    return-void
.end method
