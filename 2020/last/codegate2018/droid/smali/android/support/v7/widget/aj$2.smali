.class Landroid/support/v7/widget/aj$2;
.super Landroid/support/v7/widget/av$m;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v7/widget/aj;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Landroid/support/v7/widget/aj;


# direct methods
.method constructor <init>(Landroid/support/v7/widget/aj;)V
    .locals 0

    iput-object p1, p0, Landroid/support/v7/widget/aj$2;->a:Landroid/support/v7/widget/aj;

    invoke-direct {p0}, Landroid/support/v7/widget/av$m;-><init>()V

    return-void
.end method


# virtual methods
.method public a(Landroid/support/v7/widget/av;II)V
    .locals 3

    iget-object v0, p0, Landroid/support/v7/widget/aj$2;->a:Landroid/support/v7/widget/aj;

    invoke-virtual {p1}, Landroid/support/v7/widget/av;->computeHorizontalScrollOffset()I

    move-result v1

    invoke-virtual {p1}, Landroid/support/v7/widget/av;->computeVerticalScrollOffset()I

    move-result v2

    invoke-virtual {v0, v1, v2}, Landroid/support/v7/widget/aj;->a(II)V

    return-void
.end method
