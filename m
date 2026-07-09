Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A74AB437105
	for <mfd@lists.linux.dev>; Thu,  9 Jul 2026 17:00:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783616417; cv=none; b=U9lIHgHMkyWXG95K7lIAxJttt4pnkIoh66oxXDef+glrKCEpF6GFUz/4oUK12ZN7Zv0YosLgR7eyx/TPjFtjx/B5dVXyvbT307PwsfA9YhpVM/YDmBpDtRxT569gYDprCuVFlw7Gvky7KehP99/Tql7g3hKyii2nFun7dg9jKZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783616417; c=relaxed/simple;
	bh=qaHMCDQ0wnCBevuvFZFgR8vFowOppWXNbsk1WmPicyU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Y1BdUVkZxKBJ7tdjwWrzAcDcnk3RG9jtbGnoxMGIJ70pVk8wCanObUqp8pzb8tkIx2eimiAm0kq0I3TatT+h2RJseaP6Fd63iEXax5PKUdavCstC87xmGqwiqr8Sp8pZo0aX+QDylq2kFDusc4efB9Vg2oe5F758bRCcss1ni4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=fOrO52Uw; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="fOrO52Uw"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-472326ca506so75970f8f.2
        for <mfd@lists.linux.dev>; Thu, 09 Jul 2026 10:00:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783616414; x=1784221214; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ftx4kksthHB8P8rF6BFuSI8P+XMB3UDpz0Oz9g7bP1I=;
        b=fOrO52Uw98Jr1V6/EjzhyvfXSmyHm9TQDqdhKGRKoQ/zPXDed+RtOJiovAu13M43Xr
         Bm8DmRk+3MWUQKyI4VdgEerjfpNlBLwfNIKs4qoHvhf7viKnqNl/ZEloWHl0Y2bqAkkd
         DLnDd8WrqtLMx789f04UPKMAt4q1/3LwPpnfzbQepWWAUFk7YPsWATw0JdYtzPsgDVzd
         L7x3bDkN+9mGaXv07B2OTPPQkxhWLm853By1vr+exOnzyRv9eRJkYquY/RrhEhl0AZLX
         dHhWAhkCUrf7/UAgq+nALDY7vwO+d1P0j5JfyvbJFQmdQ3uwQ0/6JbCSB0uZlxxAsOHS
         rDSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783616414; x=1784221214;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ftx4kksthHB8P8rF6BFuSI8P+XMB3UDpz0Oz9g7bP1I=;
        b=MDgmUC9HQjGuqbAnDAX7G31bCz5r4+qZaQt3AgiramwBqXtuZBT8Rj/EY9ZyrFaMT/
         ovx/CdvQ193nYa8tQU9WvGe7gOWimezV/NmRXmBNKJXw8kLHZl/biCdU8zZiATTqirKC
         rEFPc8K0qJMplTtzlZq2n43qxlr8tz75eULw4P+OYFbUDcXiHj6drAoHD4VVF4prl5Wk
         OqNk6xH2XBM3Rs04aCYr7Uy6xJeLAYSEHdPH8VPcy5dHo7kt91YMwoAXV6XeXaElvY7n
         F9f1ue28vP23CsXkB5K9fuHIlI84JG5u3dDTdkgzi38TpQL794/2m68gKddObbZsFbZB
         6jEQ==
X-Forwarded-Encrypted: i=1; AHgh+RrZwNORwNjVgU2Fq1+CruiKLD2qogvnP+dzHWpxmnMdp9vVFRz34U0BBa3qM7F42ScuGo8=@lists.linux.dev
X-Gm-Message-State: AOJu0YzeZLK9PurmdM0qlgrJwLfALEengmV+I9PFKP7JroR1RKO6PmMD
	LzRGtWC7qCpwxyZEn8Ygm+gf0U249NAKMuGoPf2Nu05IUN1arKL3UwwLtE9Ngc8kpes=
X-Gm-Gg: AfdE7cmrt0cB2zkLOryh80gAjLAKdl1GKfnA2PyX9c5JyIA0uh3SNozWWyeyZwHORSF
	rqYIJ2Z3p9F4vYdEDN42Vtz2LH/cr8CSX/xyjqdLq/S4DwwmWi7c7EMYA8NoU2m9PN+cHng/vks
	90WEAaWgytyB9YMLCbdbPn+jHI8VEPj7uIhCzVEa790F6Q4F3y86eeYSzPIJMcop0LYW2WSgRFb
	tZeGQtlru4XZJUail0kCc8gAOXspWnzeoKqVllzWaPD+7n6DRRPWAcdDjDXC5ujskbeyUDaXGTT
	FiQQwv9dacd4i+kcHDfqOs1e9ftAkxwUYUewcSxxrA/ZUFpgCrK6AZtiialwylMs9RBWTX88Vi/
	stJ5AGIOFTWcYIGlK8saDvns4yq9Jvr3iQ1SbE7jsW1KlONWUaHdgcUw2Hy5DyuSTD4Gh9Z3VkH
	iKOWwo+WSLDCtWRSVV+/1ZpsRHWraVXbkGNUjmaXQuIDFtJ+sKeR/fHiNw37BxWQZgXgQ69J6+j
	GgYv7maWxCqkKg=
X-Received: by 2002:a05:6000:250d:b0:477:80fa:f474 with SMTP id ffacd0b85a97d-47df076bed7mr8665982f8f.38.1783616414070;
        Thu, 09 Jul 2026 10:00:14 -0700 (PDT)
Received: from localhost (p200300f65f47db043de98c19b374aa68.dip0.t-ipconnect.de. [2003:f6:5f47:db04:3de9:8c19:b374:aa68])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47a9de1e785sm52656885f8f.8.2026.07.09.10.00.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 10:00:13 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Lee Jones <lee@kernel.org>
Cc: Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	mfd@lists.linux.dev,
	chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v3 09/23] mfd: Drop unused assignment of platform_device_id driver data
Date: Thu,  9 Jul 2026 18:58:28 +0200
Message-ID:  <8f219a01ab8fb705f3da3b2bff4b1228d657b3c0.1783615311.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.55.0.11.g153666a7d9bb
In-Reply-To: <cover.1783615311.git.u.kleine-koenig@baylibre.com>
References: <cover.1783615311.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1375; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=qaHMCDQ0wnCBevuvFZFgR8vFowOppWXNbsk1WmPicyU=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqT9NHV5ayzaHMTRxZ1vJcj2e0Qsq0ixb99y703 8QmdWEAqi6JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCak/TRwAKCRCPgPtYfRL+ TngzB/9bn2VMOHKirYtFbVdvBGptXo3gP9q/1WjUMgg4jlikAF1mRjg2ik2hDfikend7CJM91ve q70Q/wAGS47iHurBLAuL5F9ByDCPX5cWQGQ4kDEBvqebOSC3WBIx483iad/iTQpqONljRVR7PN5 /cZ50Aun/PhGW+qYbIMVb+bDaQSwfjkaplQw0OF5a8YU+wafd6KpidbAK/81W34gpJCoJw8lOoW sYNr6M2uqqwt2Z0ROgI4YbPy4dkgDod6o/lgn8xfxOUcKLmGejaeY/3cKKEweD5tsSdG6jEnCxp 7W4F1KeRPdtXTR64Zj0tvpKocYUOp2Vk/2RBeyy6ZbGr/H15
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

The drivers explicitly set the .driver_data member of struct
platform_device_id to zero without relying on that value. Drop these
unused assignments

This patch doesn't modify the compiled arrays, only their representation
in source form benefits.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/mfd/cros_ec_dev.c | 2 +-
 drivers/mfd/mt6397-core.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mfd/cros_ec_dev.c b/drivers/mfd/cros_ec_dev.c
index e253c753beb6..a933cb936da6 100644
--- a/drivers/mfd/cros_ec_dev.c
+++ b/drivers/mfd/cros_ec_dev.c
@@ -375,7 +375,7 @@ static void ec_device_remove(struct platform_device *pdev)
 }
 
 static const struct platform_device_id cros_ec_id[] = {
-	{ DRV_NAME, 0 },
+	{ DRV_NAME },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(platform, cros_ec_id);
diff --git a/drivers/mfd/mt6397-core.c b/drivers/mfd/mt6397-core.c
index ea1d039477e3..7987583afc60 100644
--- a/drivers/mfd/mt6397-core.c
+++ b/drivers/mfd/mt6397-core.c
@@ -429,7 +429,7 @@ static const struct of_device_id mt6397_of_match[] = {
 MODULE_DEVICE_TABLE(of, mt6397_of_match);
 
 static const struct platform_device_id mt6397_id[] = {
-	{ "mt6397", 0 },
+	{ "mt6397" },
 	{ },
 };
 MODULE_DEVICE_TABLE(platform, mt6397_id);
-- 
2.55.0.11.g153666a7d9bb

