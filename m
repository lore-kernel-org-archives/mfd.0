Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19FBE339372
	for <mfd@lists.linux.dev>; Sun, 23 Aug 2026 17:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787506976; cv=none; b=XDysJu2IrHm+Edjc2sfIENOs1bMTEmZbhEcb0FWydrQ4uWI/wAzj6F5pJ+x28KhUrYLGqANvNgx2aI012WiDR/jHxHErR+CxCng8rzoOn4I/M2FY0AmJOUotbPqP7EO6aaXyWYlDH/t2iOfuheLZ52zCbJQJLGA71phLoU/WqC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787506976; c=relaxed/simple;
	bh=2R80yGpb1ebUfjeon9HoBof1aH/VJHhf1Nee3wvgaIQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=bluhpweAq8nL6z1jT398Wk7G1La2F7oxyKBVCVHRJ5F+7S4QAJ8+bF9LwMCw6/n4ru7UHtMLQXTQSvK/AH1v9IYxZnoVhpMxgQLs8TWifeONGKlEsYFJfVdD5BiHxaS0kphqRHO+6XDSRq3dooLVpTrPvIMHiKwY/dPa74Vzl68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UWVYfMIV; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UWVYfMIV"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-383cb94f742so2745953a91.3
        for <mfd@lists.linux.dev>; Sun, 23 Aug 2026 10:42:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787506974; x=1788111774; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7Rd0cSgl5e9XipVz+olSR45npzJwFMz3Dnz36c8PwvI=;
        b=UWVYfMIVJmGp/MP5ZJKrwRv3atnZ9ikpdpOIeVXVDDfwarIQUmwrVGb/tU7KNHi2Xz
         Fk9NAy7KR2zr61md58SzofWmOEPFUy20LMyHrXhEVLPoSf05MEdh1eoU3j/CPclJTPQK
         OcRqSgOxIzjg06nUWZQDZEFUWh9M5FPrYNUbjTn5dkOpIJjx3AdDwxUeWfh/vgoP+VDf
         CBHhP2twDCt3tK8PKlC1Jes4IWAqR2Zzb1DaJXzWCVbGqTsQxrMtZdZPWfHpoNfEjuHB
         ioEDq4+4n2P7+Ic9tWBpy1q/8pujdTG02w9XJ8i54AsrlVbgSgEPEx/As3FmNi50hwlO
         ZM1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787506974; x=1788111774;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7Rd0cSgl5e9XipVz+olSR45npzJwFMz3Dnz36c8PwvI=;
        b=HQXi771sqEl+FfBXF1e18oWHXY4xlREqDjlaYRPBuhcweEpEwgMJSoEF+AYgGSdFOC
         47wMWDVBKhdBfLAp6BJ0oYgJEfPGDCwp7MYtk8hPg4cRD4JH9Ip48P/UR91DF9y+Y9AI
         MFVpYAfJ6690ax5hxX004PYGIIMZO4mpbVAaXl6KPQPThzjy74+do1oM6EVeQZyHbgWI
         JKAIOYslZMeI9Est0F6drHj6RiJ3V9TNQxWWraYO1epkKXbkzDKHFMD1KRzg8QKPT+Qc
         mbYEhKG4X2i/K+QERhDsDLnzLY6okxI8l2aKhNPivfA7VOJ7chzcvl7gmUOuuxO4U5sJ
         M/kg==
X-Gm-Message-State: AFuF++kLfSsYjzCvvItFFrDx9UfOrrCWucgzxHtG6+2J5D9Dsf6nTXg1
	W+fTiWcntVKddkigmfSmMXra5KslhszrrCSTVyX8pfbL4yPgfJITE/sf
X-Gm-Gg: AR+sD10DNR/mRktl3qlTTqk2X583AYfJ+kfrStYRVSnkEG7DjGqIwiQL5MRjhV1dvRs
	XQ62knzxj0kpkswv1XJ3HuM0lFF8Q57JJP9gSUEdk4QHFzsjmp7RufajVkmMx2BbjOf4pKz1o4+
	F9Cos6WaQJZUpfzvG7RokJqBWVe8WBQN+AtwdK8QHUbBs5zHh+iC8ZOyM666yii948L/xOT+ZiJ
	of9VzHDx1sVRgJXpWtjEG+r8IsYDi/gUk+j7KPLAiPkhHOAFI+nW6nO9pKohQqCEm1sJJb71kkR
	E1MVc3KXvnXdWQy8Y/rwRkXZa0r6vhQNx4C8Ee08Ca2pJEIM3ev/DwStSMUX4y/JSvL6f3rYTFe
	/8rm/pu36OmRixukZgUitugLZQ5Xnpj68zDx/qKVfHMLP3UX7ktg6CazFqDz5PJ8iNxydECmrjd
	yX7G50hxkSd6nfZ7MvDqtM0Z8KoH9lTpuDT2qIfPsr1pzTr68P/29skPJHei4kX51VogyP94PZ1
	IQfZwC9urr22Q==
X-Received: by 2002:a17:90b:1f8d:b0:38c:a59b:5189 with SMTP id 98e67ed59e1d1-395df67778fmr23169451a91.15.1787506974213;
        Sun, 23 Aug 2026 10:42:54 -0700 (PDT)
Received: from kurosuda.i.sslab.ics.keio.ac.jp ([131.113.100.7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-395e49b5d8asm7052087a91.7.2026.08.23.10.42.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2026 10:42:53 -0700 (PDT)
From: Hiroki Nakajima <3na7nanana@gmail.com>
To: support.opensource@diasemi.com,
	lee@kernel.org
Cc: mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Hiroki Nakajima <3na7nanana@gmail.com>
Subject: [PATCH] mfd: da9062: Use DEFINE_RES_IRQ_NAMED()
Date: Mon, 24 Aug 2026 02:42:48 +0900
Message-Id: <20260823174248.833535-1-3na7nanana@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use the dedicated DEFINE_RES_IRQ_NAMED() helper for the DA9062 IRQ
resources instead of open-coding it with DEFINE_RES_NAMED(). This makes
the intended resource type explicit and keeps the definitions consistent
with the DA9061 resources.

This is a mechanical cleanup with no functional change.

With an x86_64 allmodconfig and W=1, drivers/mfd/da9062-core.o builds
successfully and is byte-identical before and after this change.

Assisted-by: Codex:gpt-5 coccinelle
Signed-off-by: Hiroki Nakajima <3na7nanana@gmail.com>
---
 drivers/mfd/da9062-core.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/mfd/da9062-core.c b/drivers/mfd/da9062-core.c
index 637c5f47a4b0..ad198183aff7 100644
--- a/drivers/mfd/da9062-core.c
+++ b/drivers/mfd/da9062-core.c
@@ -203,36 +203,36 @@ static const struct mfd_cell da9061_devs_noirq[] = {
 };
 
 static const struct resource da9062_core_resources[] = {
-	DEFINE_RES_NAMED(DA9062_IRQ_VDD_WARN, 1, "VDD_WARN", IORESOURCE_IRQ),
+	DEFINE_RES_IRQ_NAMED(DA9062_IRQ_VDD_WARN, "VDD_WARN"),
 };
 
 static const struct resource da9062_regulators_resources[] = {
-	DEFINE_RES_NAMED(DA9062_IRQ_LDO_LIM, 1, "LDO_LIM", IORESOURCE_IRQ),
+	DEFINE_RES_IRQ_NAMED(DA9062_IRQ_LDO_LIM, "LDO_LIM"),
 };
 
 static const struct resource da9062_thermal_resources[] = {
-	DEFINE_RES_NAMED(DA9062_IRQ_TEMP, 1, "THERMAL", IORESOURCE_IRQ),
+	DEFINE_RES_IRQ_NAMED(DA9062_IRQ_TEMP, "THERMAL"),
 };
 
 static const struct resource da9062_wdt_resources[] = {
-	DEFINE_RES_NAMED(DA9062_IRQ_WDG_WARN, 1, "WD_WARN", IORESOURCE_IRQ),
+	DEFINE_RES_IRQ_NAMED(DA9062_IRQ_WDG_WARN, "WD_WARN"),
 };
 
 static const struct resource da9062_rtc_resources[] = {
-	DEFINE_RES_NAMED(DA9062_IRQ_ALARM, 1, "ALARM", IORESOURCE_IRQ),
-	DEFINE_RES_NAMED(DA9062_IRQ_TICK, 1, "TICK", IORESOURCE_IRQ),
+	DEFINE_RES_IRQ_NAMED(DA9062_IRQ_ALARM, "ALARM"),
+	DEFINE_RES_IRQ_NAMED(DA9062_IRQ_TICK, "TICK"),
 };
 
 static const struct resource da9062_onkey_resources[] = {
-	DEFINE_RES_NAMED(DA9062_IRQ_ONKEY, 1, "ONKEY", IORESOURCE_IRQ),
+	DEFINE_RES_IRQ_NAMED(DA9062_IRQ_ONKEY, "ONKEY"),
 };
 
 static const struct resource da9062_gpio_resources[] = {
-	DEFINE_RES_NAMED(DA9062_IRQ_GPI0, 1, "GPI0", IORESOURCE_IRQ),
-	DEFINE_RES_NAMED(DA9062_IRQ_GPI1, 1, "GPI1", IORESOURCE_IRQ),
-	DEFINE_RES_NAMED(DA9062_IRQ_GPI2, 1, "GPI2", IORESOURCE_IRQ),
-	DEFINE_RES_NAMED(DA9062_IRQ_GPI3, 1, "GPI3", IORESOURCE_IRQ),
-	DEFINE_RES_NAMED(DA9062_IRQ_GPI4, 1, "GPI4", IORESOURCE_IRQ),
+	DEFINE_RES_IRQ_NAMED(DA9062_IRQ_GPI0, "GPI0"),
+	DEFINE_RES_IRQ_NAMED(DA9062_IRQ_GPI1, "GPI1"),
+	DEFINE_RES_IRQ_NAMED(DA9062_IRQ_GPI2, "GPI2"),
+	DEFINE_RES_IRQ_NAMED(DA9062_IRQ_GPI3, "GPI3"),
+	DEFINE_RES_IRQ_NAMED(DA9062_IRQ_GPI4, "GPI4"),
 };
 
 static const struct mfd_cell da9062_devs_irq[] = {

base-commit: 9d0e4b1ae5b045a2c92b0b9a1c3b268191c219d9
-- 
2.34.1

