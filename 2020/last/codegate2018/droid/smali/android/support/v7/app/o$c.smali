.class Landroid/support/v7/app/o$c;
.super Landroid/support/v7/view/i;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v7/app/o;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "c"
.end annotation


# instance fields
.field final synthetic a:Landroid/support/v7/app/o;


# direct methods
.method public constructor <init>(Landroid/support/v7/app/o;Landroid/view/Window$Callback;)V
    .locals 0

    iput-object p1, p0, Landroid/support/v7/app/o$c;->a:Landroid/support/v7/app/o;

    invoke-direct {p0, p2}, Landroid/support/v7/view/i;-><init>(Landroid/view/Window$Callback;)V

    return-void
.end method


# virtual methods
.method public onCreatePanelView(I)Landroid/view/View;
    .locals 2

    if-nez p1, :cond_0

    new-instance v0, Landroid/view/View;

    iget-object v1, p0, Landroid/support/v7/app/o$c;->a:Landroid/support/v7/app/o;

    iget-object v1, v1, Landroid/support/v7/app/o;->a:Landroid/support/v7/widget/af;

    invoke-interface {v1}, Landroid/support/v7/widget/af;->b()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    :goto_0
    return-object v0

    :cond_0
    invoke-super {p0, p1}, Landroid/support/v7/view/i;->onCreatePanelView(I)Landroid/view/View;

    move-result-object v0

    goto :goto_0
.end method

.method public onPreparePanel(ILandroid/view/View;Landroid/view/Menu;)Z
    .locals 3

    invoke-super {p0, p1, p2, p3}, Landroid/support/v7/view/i;->onPreparePanel(ILandroid/view/View;Landroid/view/Menu;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v1, p0, Landroid/support/v7/app/o$c;->a:Landroid/support/v7/app/o;

    iget-boolean v1, v1, Landroid/support/v7/app/o;->b:Z

    if-nez v1, :cond_0

    iget-object v1, p0, Landroid/support/v7/app/o$c;->a:Landroid/support/v7/app/o;

    iget-object v1, v1, Landroid/support/v7/app/o;->a:Landroid/support/v7/widget/af;

    invoke-interface {v1}, Landroid/support/v7/widget/af;->m()V

    iget-object v1, p0, Landroid/support/v7/app/o$c;->a:Landroid/support/v7/app/o;

    const/4 v2, 0x1

    iput-boolean v2, v1, Landroid/support/v7/app/o;->b:Z

    :cond_0
    return v0
.end method
