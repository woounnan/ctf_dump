.class Landroid/support/design/widget/BottomSheetBehavior$c;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/design/widget/BottomSheetBehavior;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "c"
.end annotation


# instance fields
.field final synthetic a:Landroid/support/design/widget/BottomSheetBehavior;

.field private final b:Landroid/view/View;

.field private final c:I


# direct methods
.method constructor <init>(Landroid/support/design/widget/BottomSheetBehavior;Landroid/view/View;I)V
    .locals 0

    iput-object p1, p0, Landroid/support/design/widget/BottomSheetBehavior$c;->a:Landroid/support/design/widget/BottomSheetBehavior;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Landroid/support/design/widget/BottomSheetBehavior$c;->b:Landroid/view/View;

    iput p3, p0, Landroid/support/design/widget/BottomSheetBehavior$c;->c:I

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    iget-object v0, p0, Landroid/support/design/widget/BottomSheetBehavior$c;->a:Landroid/support/design/widget/BottomSheetBehavior;

    iget-object v0, v0, Landroid/support/design/widget/BottomSheetBehavior;->e:Landroid/support/v4/widget/n;

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroid/support/design/widget/BottomSheetBehavior$c;->a:Landroid/support/design/widget/BottomSheetBehavior;

    iget-object v0, v0, Landroid/support/design/widget/BottomSheetBehavior;->e:Landroid/support/v4/widget/n;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/support/v4/widget/n;->a(Z)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroid/support/design/widget/BottomSheetBehavior$c;->b:Landroid/view/View;

    invoke-static {v0, p0}, Landroid/support/v4/i/q;->a(Landroid/view/View;Ljava/lang/Runnable;)V

    :goto_0
    return-void

    :cond_0
    iget-object v0, p0, Landroid/support/design/widget/BottomSheetBehavior$c;->a:Landroid/support/design/widget/BottomSheetBehavior;

    iget v1, p0, Landroid/support/design/widget/BottomSheetBehavior$c;->c:I

    invoke-virtual {v0, v1}, Landroid/support/design/widget/BottomSheetBehavior;->b(I)V

    goto :goto_0
.end method
