Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795432755;
	b=NP5iMIYBtwfswT2Qwdief5TSODEXGsdpTFgbM3p0b7eo2e88OvZYBcgmSzE8kklZmxiu
	 YW5Bh0QKzkwfZGC7VGp+PfG1gLIKKb0TfrNAwtRHmbc45eJ+Gg9d2uoulF5VKme3PLFPE
	 2H2n3mk5pBptiAg7Wi3lw7sy2OcFCPMrHpKb4GY29LbHKUPOOuBGtGYLqc2kS0YXemx9b
	 RZUOcX3utlOgE3wDaNW43FiGsg5fw6tQQgMH5j7gl/akcWaULpETWQJbLIBO1V+EgUDW/
	 mewmHbGsY+Wlj7qO+iwkcEQjpkBO1kFsxB5VcHflbVMrBiHiYPzMchPX3WNmpBZATow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795432755;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=tsoBXjOa7hArC6ZxKTNtqNgzpzMWZ3WS6d1t6Lz3KOk=;
	b=4MHpR6cuyj3CH/bVCdfcL4OkUNofhdpk3S/DYdokHuqka0Ukdno3dy0WRRckikBA71+j
	 pA8jZ7g2PUAoD3GEwweQ1qIqgayXK03dnELLeCgRzpzdgUtItkep0wfPwMHnITlKE11Pu
	 Ih5KcaDxM78SoLx3ZA0UG8xLXddO4uIXbS/8RG7OC/oeD8JXAIaIF9EUm8wkURq2d15Zf
	 KTpezXQlfl4pP75Ifqh65Rb8F9ZgQHcNetISkLifsv85qukWbL610sndaYj8yTj/wMcPe
	 CO8HF/vwbBgYkfTHkP82jt1OjMJCx/kTPOkOiKjz4qtuLAmLTWErI1L1ipbI6xvONzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=HwLiG7+z;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A952606A699
	for <mfd@lists.linux.dev>; Mon, 23 Nov 2026 11:19:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1A952606A699
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=HwLiG7+z
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4bb6adaf0f1so27256625e9.0
        for <mfd@lists.linux.dev>; Mon, 23 Nov 2026 03:19:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795432753; x=1796037553; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tsoBXjOa7hArC6ZxKTNtqNgzpzMWZ3WS6d1t6Lz3KOk=;
        b=HwLiG7+zc1KNcZewTq/NDk/soQMVlHoUEE9eTpGR86Zs93WbU19hlwP/TLUHQllNOR
         CAaV4k6t/eu/qBu17zLpy8dez3hDEgwn0WdBGswbVUP3bTTKKwPHPrXoFaZA9a7SmGpy
         uk+3M4QzSBrtkC2X5u+WGuxU1G+cWJUWUUJjOVFumCigXe1ZBda67DxydyucjYZ/XTaz
         Qoy+jWIWvYgdpLxV7rCqcNjEUNQ8NKwVzC1VjhbNX6RyBkzSwFZPQUqni77+AkThcFAa
         NN1gVEGfJnuwntg7C3Rad+IgqSVZZUtYyTIL6Qoy/CNqASn3bsVS8PMvd9mGa1LJ5d6q
         2iLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795432753; x=1796037553;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tsoBXjOa7hArC6ZxKTNtqNgzpzMWZ3WS6d1t6Lz3KOk=;
        b=zRiwBjMC/V6SZNHQvDTx8ti9g/e8BwdNo3/64H6qbdlnjMm2WToHiHH7lgkMnZ0DIO
         4v6k6eI+4WoHEMASB0CTnWU59lu73LrZY84FLH/xI9IPyHwQsOd+yK5gt/NVwNpH4QV9
         EwYcp5Hg1yVXf3n0puXNHL9ff9h9LLe/lFZY7xYnbSjFOkfP4goF/ycp/FlrCS3Fbhg4
         JgkUDDqPiuapVDZeKl5/prMrBei3aocxMrAu6M7kaQAyYTXsoQnz1OL+D8mJ0zMjRsnx
         WuqYuOhhdBOq6OeI2RYhupvN4pqCFddBAgMg3kDzhvlja6BA6PRgLqypeaeIZ0sqghD2
         BObw==
X-Forwarded-Encrypted: i=1; AL+hErEnlo0J3WoFtUshNa1vh81Nz31MZnY1xtTV5OLePAF4qi831h4WLCYkZxO1kf7U6Lh9LXk=@lists.linux.dev
X-Gm-Message-State: APuU4Z8Gfftxal8ysAIyWHJVJzgjwFeUBTWnPHgaeYcXYTKz7oeqnUI6
	eKosDyQEKVBUTVpE7I0Qec4bqqrMIhg3uzvFC4y7Yn0SLeH951aHqfsAQBDszZdJluY=
X-Gm-Gg: AZFdTZep/mfzHas17Msb4u2vDOBlQpctUPOqFOJPg+QS/GAPOMUmZf5+grd83QoIabD
	ILN6hVRbXY4rx3F4HzaQAhCRB3WHd3Fj+WtKpXGJ0SXrXEe+Tt6AcINSdZRRKUoo9tEYRVpjtQo
	w1RkiA+lOgTdBpDUZoQnsscoRBZV9wheO1OtYxWOvXfGxo1FqkzZg6XiCHnOH4BFWtVvhqx/0CZ
	MtDIUvYRcfvIx/emssezmDgyTZzdhPKVEQNKEp5AaIkfzq40Q6rsybiWFYZfixSXpa77JLUNw1W
	5E2S/clRRWZcM9k9hvzVbOk7/Wles5vN9Ugq3jb2cFkhY33YObe+Pu+LINIjtX3LF/MOHPf0tZs
	EHYT9vvath9UpciawAp8ogvAs/Nwxw1z3v+KC+iTAoHqPq2iefjl29ZumVYIQheM0pvsyFWwro3
	N0Sd4ti6FZRXaA2NvKAzoyXiLA0n43935ZpP0jSR4V/Wr2ztF596VqYjIvH7o9USWMhrMp0pzZs
	1HI2kX8tPZVCt4iwoeHkCArTiHoMmcDf7RMe392zkExT+WDEj79/HGm7hTq2iRelQTI+CTd1dnP
	1sxQVm+2BRM58rMAIrH84DpSYHm3KzJM+BpwEycwNMpC+5rgfxoJSO85FyvHULMO79rEmvIHsZJ
	4tNiL0YDszc2Sh2LQ
X-Received: by 2002:a05:600c:3e1a:b0:4bb:6814:7391 with SMTP id 5b1f17b1804b1-4bb8881921cmr219874935e9.25.1795432753450;
        Mon, 23 Nov 2026 03:19:13 -0800 (PST)
Received: from localhost (p200300f65f19a90438645cebc2ee104e.dip0.t-ipconnect.de. [2003:f6:5f19:a904:3864:5ceb:c2ee:104e])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4ab6a67fec7sm20288415f8f.26.2026.11.23.03.19.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 03:19:13 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Lee Jones <lee@kernel.org>
Cc: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>,
	Xu Yilun <yilun.xu@intel.com>,
	Tom Rix <trix@redhat.com>,
	mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Linus Walleij <linusw@kernel.org>
Subject: [PATCH v5 09/17] mfd: intel-m10-bmc-pmci: Use named initializers for dfl_device_id array
Date: Mon, 23 Nov 2026 12:18:07 +0100
Message-ID:  <422064899e61f8265ec9aeb73f60ac6d37b6440e.1795431460.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1795431460.git.u.kleine-koenig@baylibre.com>
References: <cover.1795431460.git.u.kleine-koenig@baylibre.com>
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1285; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=NyYODZOs4QqPpo8EPg0xidXW1ul5pfGAFUJrCD2s98I=; b=kA0DAAoBj4D7WH0S/k4ByyZiAGsEIP3I49+DK2nEjPWZAx6JWaDG0SSUyR2luKCrhZwqTTAbI okBMwQAAQoAHRYhBD+BrGk6eh5Zia3+04+A+1h9Ev5OBQJrBCD9AAoJEI+A+1h9Ev5O7ugH/jhi 46vSDOIzZ/yDXyWZ3cyF098qB4lZQv9TRG9Sezwhq9Yu6e29VGYrzySYPclk6kUyAzvB6kb7WeB fPodMEsZC8SELAur/fpRsoa+x5eyT7lji//vKsZC+pGYvNOApDoVCGXE5HSmqvtyonfyAKPMrYK CYTVc/0cw3ds6h2z7V9gfAru8Y+VXt+27WQjkBDdorahmwsGe5WjtNqox3E8CTQ5iRdZVbz2x0H ei5W2EMHNL78X90xrS4JkcejU8NeyR9g9kn6NZC9Rczt94ehlbV8YdWfJuVZ1HJpJrt4FW5kRqg +eqFFM+UA5LheZ3t2Ml5pYg88SvK+LubWzWmRFc=
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

From: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>

While being less compact, using named initializers allows to more easily
see which members of the structs are assigned which value without having
to lookup the declaration of the struct. And it's also more robust
against changes to the struct definition.

The mentioned robustness is relevant for a planned change to struct
dfl_device_id that replaces .driver_data by an anonymous union.

This patch doesn't modify the compiled array, only its representation
in source form benefits.

Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/mfd/intel-m10-bmc-pmci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mfd/intel-m10-bmc-pmci.c b/drivers/mfd/intel-m10-bmc-pmci.c
index 825a4cfd5d98..06b2abc9d4cf 100644
--- a/drivers/mfd/intel-m10-bmc-pmci.c
+++ b/drivers/mfd/intel-m10-bmc-pmci.c
@@ -434,7 +434,7 @@ static void m10bmc_pmci_remove(struct dfl_device *ddev)
 #define FME_FEATURE_ID_M10BMC_PMCI	0x12
 
 static const struct dfl_device_id m10bmc_pmci_ids[] = {
-	{ FME_ID, FME_FEATURE_ID_M10BMC_PMCI },
+	{ .type = FME_ID, .feature_id = FME_FEATURE_ID_M10BMC_PMCI },
 	{ }
 };
 MODULE_DEVICE_TABLE(dfl, m10bmc_pmci_ids);
-- 
2.47.3

