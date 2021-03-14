.class public final Lno/tghack/gaiainvaders/Invader$Companion;
.super Ljava/lang/Object;
.source "Invader.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lno/tghack/gaiainvaders/Invader;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Companion"
.end annotation

.annotation runtime Lkotlin/Metadata;
    bv = {
        0x1,
        0x0,
        0x3
    }
    d1 = {
        "\u0000\u001c\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0008\n\u0002\u0010\u0008\n\u0002\u0008\u0005\u0008\u0086\u0003\u0018\u00002\u00020\u0001B\u0007\u0008\u0002\u00a2\u0006\u0002\u0010\u0002R\u001c\u0010\u0003\u001a\u0004\u0018\u00010\u0004X\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\u0005\u0010\u0006\"\u0004\u0008\u0007\u0010\u0008R\u001c\u0010\t\u001a\u0004\u0018\u00010\u0004X\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\n\u0010\u0006\"\u0004\u0008\u000b\u0010\u0008R\u001a\u0010\u000c\u001a\u00020\rX\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\u000e\u0010\u000f\"\u0004\u0008\u0010\u0010\u0011\u00a8\u0006\u0012"
    }
    d2 = {
        "Lno/tghack/gaiainvaders/Invader$Companion;",
        "",
        "()V",
        "bitmap1",
        "Landroid/graphics/Bitmap;",
        "getBitmap1",
        "()Landroid/graphics/Bitmap;",
        "setBitmap1",
        "(Landroid/graphics/Bitmap;)V",
        "bitmap2",
        "getBitmap2",
        "setBitmap2",
        "numberOfInvaders",
        "",
        "getNumberOfInvaders",
        "()I",
        "setNumberOfInvaders",
        "(I)V",
        "app_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x1,
        0x10
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V
    .locals 0

    .line 33
    invoke-direct {p0}, Lno/tghack/gaiainvaders/Invader$Companion;-><init>()V

    return-void
.end method


# virtual methods
.method public final getBitmap1()Landroid/graphics/Bitmap;
    .locals 1

    .line 35
    invoke-static {}, Lno/tghack/gaiainvaders/Invader;->access$getBitmap1$cp()Landroid/graphics/Bitmap;

    move-result-object v0

    return-object v0
.end method

.method public final getBitmap2()Landroid/graphics/Bitmap;
    .locals 1

    .line 36
    invoke-static {}, Lno/tghack/gaiainvaders/Invader;->access$getBitmap2$cp()Landroid/graphics/Bitmap;

    move-result-object v0

    return-object v0
.end method

.method public final getNumberOfInvaders()I
    .locals 1

    .line 40
    invoke-static {}, Lno/tghack/gaiainvaders/Invader;->access$getNumberOfInvaders$cp()I

    move-result v0

    return v0
.end method

.method public final setBitmap1(Landroid/graphics/Bitmap;)V
    .locals 0

    .line 35
    invoke-static {p1}, Lno/tghack/gaiainvaders/Invader;->access$setBitmap1$cp(Landroid/graphics/Bitmap;)V

    return-void
.end method

.method public final setBitmap2(Landroid/graphics/Bitmap;)V
    .locals 0

    .line 36
    invoke-static {p1}, Lno/tghack/gaiainvaders/Invader;->access$setBitmap2$cp(Landroid/graphics/Bitmap;)V

    return-void
.end method

.method public final setNumberOfInvaders(I)V
    .locals 0

    .line 40
    invoke-static {p1}, Lno/tghack/gaiainvaders/Invader;->access$setNumberOfInvaders$cp(I)V

    return-void
.end method
