.class public final Lno/tghack/gaiainvaders/SoundPlayer;
.super Ljava/lang/Object;
.source "SoundPlayer.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lno/tghack/gaiainvaders/SoundPlayer$Companion;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    bv = {
        0x1,
        0x0,
        0x3
    }
    d1 = {
        "\u0000&\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0010\u0008\n\u0002\u0008\u0002\u0018\u0000 \u000b2\u00020\u0001:\u0001\u000bB\r\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0002\u0010\u0004J\u000e\u0010\u0007\u001a\u00020\u00082\u0006\u0010\t\u001a\u00020\nR\u000e\u0010\u0005\u001a\u00020\u0006X\u0082\u0004\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u000c"
    }
    d2 = {
        "Lno/tghack/gaiainvaders/SoundPlayer;",
        "",
        "context",
        "Landroid/content/Context;",
        "(Landroid/content/Context;)V",
        "soundPool",
        "Landroid/media/SoundPool;",
        "playSound",
        "",
        "id",
        "",
        "Companion",
        "app_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x1,
        0x10
    }
.end annotation


# static fields
.field public static final Companion:Lno/tghack/gaiainvaders/SoundPlayer$Companion;

.field private static damageShelterID:I

.field private static invaderExplodeID:I

.field private static ohID:I

.field private static playerExplodeID:I

.field private static shootID:I

.field private static uhID:I


# instance fields
.field private final soundPool:Landroid/media/SoundPool;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Lno/tghack/gaiainvaders/SoundPlayer$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lno/tghack/gaiainvaders/SoundPlayer$Companion;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lno/tghack/gaiainvaders/SoundPlayer;->Companion:Lno/tghack/gaiainvaders/SoundPlayer$Companion;

    const/4 v0, -0x1

    .line 18
    sput v0, Lno/tghack/gaiainvaders/SoundPlayer;->playerExplodeID:I

    .line 19
    sput v0, Lno/tghack/gaiainvaders/SoundPlayer;->invaderExplodeID:I

    .line 20
    sput v0, Lno/tghack/gaiainvaders/SoundPlayer;->shootID:I

    .line 21
    sput v0, Lno/tghack/gaiainvaders/SoundPlayer;->damageShelterID:I

    .line 22
    sput v0, Lno/tghack/gaiainvaders/SoundPlayer;->uhID:I

    .line 23
    sput v0, Lno/tghack/gaiainvaders/SoundPlayer;->ohID:I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 6

    const-string v0, "assetManager.openFd(\"damageshelter.ogg\")"

    const-string v1, "damageshelter.ogg"

    const-string v2, "context"

    invoke-static {p1, v2}, Lkotlin/jvm/internal/Intrinsics;->checkParameterIsNotNull(Ljava/lang/Object;Ljava/lang/String;)V

    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 13
    new-instance v2, Landroid/media/SoundPool;

    const/4 v3, 0x0

    const/16 v4, 0xa

    const/4 v5, 0x3

    invoke-direct {v2, v4, v5, v3}, Landroid/media/SoundPool;-><init>(III)V

    iput-object v2, p0, Lno/tghack/gaiainvaders/SoundPlayer;->soundPool:Landroid/media/SoundPool;

    .line 29
    :try_start_0
    invoke-virtual {p1}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object p1

    const-string v2, "shoot.ogg"

    .line 34
    invoke-virtual {p1, v2}, Landroid/content/res/AssetManager;->openFd(Ljava/lang/String;)Landroid/content/res/AssetFileDescriptor;

    move-result-object v2

    const-string v4, "assetManager.openFd(\"shoot.ogg\")"

    invoke-static {v2, v4}, Lkotlin/jvm/internal/Intrinsics;->checkExpressionValueIsNotNull(Ljava/lang/Object;Ljava/lang/String;)V

    .line 35
    iget-object v4, p0, Lno/tghack/gaiainvaders/SoundPlayer;->soundPool:Landroid/media/SoundPool;

    invoke-virtual {v4, v2, v3}, Landroid/media/SoundPool;->load(Landroid/content/res/AssetFileDescriptor;I)I

    move-result v2

    sput v2, Lno/tghack/gaiainvaders/SoundPlayer;->shootID:I

    const-string v2, "invaderexplode.ogg"

    .line 37
    invoke-virtual {p1, v2}, Landroid/content/res/AssetManager;->openFd(Ljava/lang/String;)Landroid/content/res/AssetFileDescriptor;

    move-result-object v2

    const-string v4, "assetManager.openFd(\"invaderexplode.ogg\")"

    invoke-static {v2, v4}, Lkotlin/jvm/internal/Intrinsics;->checkExpressionValueIsNotNull(Ljava/lang/Object;Ljava/lang/String;)V

    .line 38
    iget-object v4, p0, Lno/tghack/gaiainvaders/SoundPlayer;->soundPool:Landroid/media/SoundPool;

    invoke-virtual {v4, v2, v3}, Landroid/media/SoundPool;->load(Landroid/content/res/AssetFileDescriptor;I)I

    move-result v2

    sput v2, Lno/tghack/gaiainvaders/SoundPlayer;->invaderExplodeID:I

    .line 40
    invoke-virtual {p1, v1}, Landroid/content/res/AssetManager;->openFd(Ljava/lang/String;)Landroid/content/res/AssetFileDescriptor;

    move-result-object v2

    invoke-static {v2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkExpressionValueIsNotNull(Ljava/lang/Object;Ljava/lang/String;)V

    .line 41
    iget-object v4, p0, Lno/tghack/gaiainvaders/SoundPlayer;->soundPool:Landroid/media/SoundPool;

    invoke-virtual {v4, v2, v3}, Landroid/media/SoundPool;->load(Landroid/content/res/AssetFileDescriptor;I)I

    move-result v2

    sput v2, Lno/tghack/gaiainvaders/SoundPlayer;->damageShelterID:I

    const-string v2, "playerexplode.ogg"

    .line 43
    invoke-virtual {p1, v2}, Landroid/content/res/AssetManager;->openFd(Ljava/lang/String;)Landroid/content/res/AssetFileDescriptor;

    move-result-object v2

    const-string v4, "assetManager.openFd(\"playerexplode.ogg\")"

    invoke-static {v2, v4}, Lkotlin/jvm/internal/Intrinsics;->checkExpressionValueIsNotNull(Ljava/lang/Object;Ljava/lang/String;)V

    .line 44
    iget-object v4, p0, Lno/tghack/gaiainvaders/SoundPlayer;->soundPool:Landroid/media/SoundPool;

    invoke-virtual {v4, v2, v3}, Landroid/media/SoundPool;->load(Landroid/content/res/AssetFileDescriptor;I)I

    move-result v2

    sput v2, Lno/tghack/gaiainvaders/SoundPlayer;->playerExplodeID:I

    .line 46
    invoke-virtual {p1, v1}, Landroid/content/res/AssetManager;->openFd(Ljava/lang/String;)Landroid/content/res/AssetFileDescriptor;

    move-result-object v1

    invoke-static {v1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkExpressionValueIsNotNull(Ljava/lang/Object;Ljava/lang/String;)V

    .line 47
    iget-object v0, p0, Lno/tghack/gaiainvaders/SoundPlayer;->soundPool:Landroid/media/SoundPool;

    invoke-virtual {v0, v1, v3}, Landroid/media/SoundPool;->load(Landroid/content/res/AssetFileDescriptor;I)I

    move-result v0

    sput v0, Lno/tghack/gaiainvaders/SoundPlayer;->damageShelterID:I

    const-string v0, "uh.ogg"

    .line 49
    invoke-virtual {p1, v0}, Landroid/content/res/AssetManager;->openFd(Ljava/lang/String;)Landroid/content/res/AssetFileDescriptor;

    move-result-object v0

    const-string v1, "assetManager.openFd(\"uh.ogg\")"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->checkExpressionValueIsNotNull(Ljava/lang/Object;Ljava/lang/String;)V

    .line 50
    iget-object v1, p0, Lno/tghack/gaiainvaders/SoundPlayer;->soundPool:Landroid/media/SoundPool;

    invoke-virtual {v1, v0, v3}, Landroid/media/SoundPool;->load(Landroid/content/res/AssetFileDescriptor;I)I

    move-result v0

    sput v0, Lno/tghack/gaiainvaders/SoundPlayer;->uhID:I

    const-string v0, "oh.ogg"

    .line 52
    invoke-virtual {p1, v0}, Landroid/content/res/AssetManager;->openFd(Ljava/lang/String;)Landroid/content/res/AssetFileDescriptor;

    move-result-object p1

    const-string v0, "assetManager.openFd(\"oh.ogg\")"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkExpressionValueIsNotNull(Ljava/lang/Object;Ljava/lang/String;)V

    .line 53
    iget-object v0, p0, Lno/tghack/gaiainvaders/SoundPlayer;->soundPool:Landroid/media/SoundPool;

    invoke-virtual {v0, p1, v3}, Landroid/media/SoundPool;->load(Landroid/content/res/AssetFileDescriptor;I)I

    move-result p1

    sput p1, Lno/tghack/gaiainvaders/SoundPlayer;->ohID:I
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    const-string p1, "error"

    const-string v0, "failed to load sound files"

    .line 58
    invoke-static {p1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :goto_0
    return-void
.end method

.method public static final synthetic access$getDamageShelterID$cp()I
    .locals 1

    .line 10
    sget v0, Lno/tghack/gaiainvaders/SoundPlayer;->damageShelterID:I

    return v0
.end method

.method public static final synthetic access$getInvaderExplodeID$cp()I
    .locals 1

    .line 10
    sget v0, Lno/tghack/gaiainvaders/SoundPlayer;->invaderExplodeID:I

    return v0
.end method

.method public static final synthetic access$getOhID$cp()I
    .locals 1

    .line 10
    sget v0, Lno/tghack/gaiainvaders/SoundPlayer;->ohID:I

    return v0
.end method

.method public static final synthetic access$getPlayerExplodeID$cp()I
    .locals 1

    .line 10
    sget v0, Lno/tghack/gaiainvaders/SoundPlayer;->playerExplodeID:I

    return v0
.end method

.method public static final synthetic access$getShootID$cp()I
    .locals 1

    .line 10
    sget v0, Lno/tghack/gaiainvaders/SoundPlayer;->shootID:I

    return v0
.end method

.method public static final synthetic access$getUhID$cp()I
    .locals 1

    .line 10
    sget v0, Lno/tghack/gaiainvaders/SoundPlayer;->uhID:I

    return v0
.end method

.method public static final synthetic access$setDamageShelterID$cp(I)V
    .locals 0

    .line 10
    sput p0, Lno/tghack/gaiainvaders/SoundPlayer;->damageShelterID:I

    return-void
.end method

.method public static final synthetic access$setInvaderExplodeID$cp(I)V
    .locals 0

    .line 10
    sput p0, Lno/tghack/gaiainvaders/SoundPlayer;->invaderExplodeID:I

    return-void
.end method

.method public static final synthetic access$setOhID$cp(I)V
    .locals 0

    .line 10
    sput p0, Lno/tghack/gaiainvaders/SoundPlayer;->ohID:I

    return-void
.end method

.method public static final synthetic access$setPlayerExplodeID$cp(I)V
    .locals 0

    .line 10
    sput p0, Lno/tghack/gaiainvaders/SoundPlayer;->playerExplodeID:I

    return-void
.end method

.method public static final synthetic access$setShootID$cp(I)V
    .locals 0

    .line 10
    sput p0, Lno/tghack/gaiainvaders/SoundPlayer;->shootID:I

    return-void
.end method

.method public static final synthetic access$setUhID$cp(I)V
    .locals 0

    .line 10
    sput p0, Lno/tghack/gaiainvaders/SoundPlayer;->uhID:I

    return-void
.end method


# virtual methods
.method public final playSound(I)V
    .locals 7

    .line 63
    iget-object v0, p0, Lno/tghack/gaiainvaders/SoundPlayer;->soundPool:Landroid/media/SoundPool;

    const/high16 v2, 0x3f800000    # 1.0f

    const/high16 v3, 0x3f800000    # 1.0f

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/high16 v6, 0x3f800000    # 1.0f

    move v1, p1

    invoke-virtual/range {v0 .. v6}, Landroid/media/SoundPool;->play(IFFIIF)I

    return-void
.end method
