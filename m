Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794733900;
	b=N4bQGuFwNYIm+vMGxq/OT9rwpdNF4Fy686nsct7FLWPYMrh0iZYdAdXL0ikuH5HyAep5
	 zD5I53MIauVaHtdR8V6VCwnR6o+an+ljiZAHHdShI//O7Q6E15kMzi+7mUrFNb4MPNCKi
	 FKUU0FpFG2Lo5uStcB1ta/VjFwAmv4d9SRPJKGnJZwaYPF7WoepYXXlyqSX6xmZqk6Muk
	 zsoRYcDirnswO3ssA830wA2g8teIrmKiz9iBeAyBLsQUMaqDVHM3dKFmbim3qc1QLmVrf
	 sGW25tUDZa8jfYcPyPTmR4mwCJZsVJna20sskUPq/NVx9O2Tm/1hQSGhgjoRBnmBuog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794733900;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=wcWcH7tJyixpCkmaYR6T6VjPcinuyJPX3UgBgsh3a94=;
	b=ynF1h2GYO2Bjin+1r1w1MQ64WXM3rH1OgVukuW/6AuAfyMzWiVzuHFiEumIbtCA1Vv+W
	 GYzlJvYIN0nk/1mU5vgJ2D1u40b7uh/MtLP2oPtIZPy3bJQByvF4usM88rg90+iBGdqOA
	 MOSW230Xin6icTnOByfBf5G5EHNkoCKFQVN/9iUqRcHRgM7pywbYqBlOiQJnvUd+G/EM0
	 tkO4rnrNSMbaNEbkVadW+gtF9yxVvncpudMh7HW5GW4+3PBnkC3LANF0TDqVFfx1TbZHQ
	 U+zPXv1PbRciDsuhWUyVUzN+pokBF3nJuvjLg2tELkaVw/ns3lToJ/zdzMStmOx9v/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fu5cfvLa;
	arc=none smtp.remote-ip=209.85.218.54
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2342606A885
	for <mfd@lists.linux.dev>; Sun, 15 Nov 2026 09:11:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2342606A885
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fu5cfvLa
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c50933bdf4bso505411466b.1
        for <mfd@lists.linux.dev>; Sun, 15 Nov 2026 01:11:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794733898; x=1795338698; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wcWcH7tJyixpCkmaYR6T6VjPcinuyJPX3UgBgsh3a94=;
        b=fu5cfvLajSmut354G+NldfEFLMzcMZuJb9uMsG5Vb6ONmtKA1Z5FTzI4jLAHjwIKzx
         n+x9QpqKTW5cfT+i1fOjck83jvMjkfURF8c8FFbU5aNz5uIBrtUY2U0eYFMb3J9Ejpnn
         /Bx9hAipFAP0wFNezPHQM5tiS3JJqdAlIWh30DksWb/D4ypaE6tO5vm238of393HuaVx
         fxysiWYvh/3zDIjM2gndPQs7J4BdRuslU52I/zKyQ4f5HlM4poPqMYg+6BQXAeq6X2Af
         EVhzrfG4iYePdhxuZktyIK7vbeGrxFt3tDbfUVi3eu3NgyJEdEsNSU/dL0OeNCfE0RTo
         5Pkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794733898; x=1795338698;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wcWcH7tJyixpCkmaYR6T6VjPcinuyJPX3UgBgsh3a94=;
        b=esjGtoODwylKnee8tof14NPog4iUVpMnRK77Mw+47gfoPJvKg1OtC7p23g0Oyfgy2/
         9sOUg0GTeepjvJV9vM+pp7e7fCNXGgvcD1F5lMatQLRd+TvjHCZtCKtsUxYOHjb3w2Jc
         rHDzWsG4v48mNiVxDU+JC3XtVhLgWQh6hah+F/x9iPrszaX8nb4cDZ6bXweD5U4cjitA
         GzVvb+KynWQTBF1UQoTSaD+5bZLFEo0yzkhLgvq2chGvxTdQ9bTOzAcH3LkK8kO6jLIV
         pqqBbGKXG/ICrSZOqNrTkv/P6OZ2AqVYD40K7DSOhF+amocWYKoGy+lKt5sJ2ag3JzdK
         fjEQ==
X-Forwarded-Encrypted: i=1; AL+hErED/hqQSf+todCN8BuP4g5wT+AOT6x3wpRJ+WnDrS5Q8XRmtHPEYjNID5d/O8m6+ySlxRM=@lists.linux.dev
X-Gm-Message-State: APuU4Z86DMgoItIoS8pNHrKIOmS6M1igXZuo6hcPFc8BRV323jj/Uy/z
	tOkBd50nE5py17+1tgem34Mazi+P3nBXFrTCZ4/PzkDd8BpdL8j8LRUj
X-Gm-Gg: AYBFou1gVgIu2cPspZCaKkWFSsBMPOG2EJpPtmM77VpqCYZtxRXLgh+VjgqEy59Y9Zi
	FdSVdhI1bjojGW94nyCrnvw9FK33EdS8Jas1wor1wqTWIEfutD1keTYgLUrooF6mZuAxQGDijpV
	jodl88YKGQk72E4KA5qkWB1/2r5X9pCrT1RFkhv7fx93Pzk+CuQDJQSHCR4w7G2Jk8oN8Ilb4lE
	Gu42xotjXERJlCWUY3odCLulzhIDOWjy/SQWp0RJTk6LoVrdqyP7ughHRSp/QCi5BERI6ATgCie
	NEnwvY4wmafT56ttRBh7WR4Nb91PGs2vUuUlgx3wPsm2mLzZrwDryUnWSzkBo1s0Ml64hhLX3zB
	no/vnEVjJSNQxk3xyfW6ZIUcP2vR0aPmTYtiMAco9hJijbeFIl/phT3bi1LC9l2IfIAx7iV5P2u
	76g/CN3tXWx/MDbcYWeuIToM9s2dQ+CZovIstusGLJAEPIHCLGXGWc941kiINbxHUc/4FfTdeX/
	x97ouLAnO7wzAeRAoBDTYs0NF9MquWz1FJQjclWMCB0Y/vZXwqHsT2DrIpWun+Ny9hKAh61I+6Q
	3jx/w+czdKiLz6Jf1ACIRE38slUwSQIhAdS88bX5gN/2rxwze5W9SCUQWOCnqSFhy7b17m4SLWD
	X6VkayDAgrQ==
X-Received: by 2002:a17:907:3f8d:b0:c46:8b87:c212 with SMTP id a640c23a62f3a-c50963bba0cmr735412066b.20.1794733897981;
        Sun, 15 Nov 2026 01:11:37 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b3dbaesm289392366b.32.2026.11.15.01.11.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 01:11:37 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-iio@vger.kernel.org,
	mfd@lists.linux.dev
Subject: [PATCH v2 4/4] mfd: max8907: Add ADC cell
Date: Sun, 15 Nov 2026 11:11:20 +0200
Message-ID: <20261115091120.108684-5-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261115091120.108684-1-clamor95@gmail.com>
References: <20261115091120.108684-1-clamor95@gmail.com>
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the ADC cell name to the list of MAX8907 cells.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/mfd/max8907.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mfd/max8907.c b/drivers/mfd/max8907.c
index 2aaea750d1690..2d94248011915 100644
--- a/drivers/mfd/max8907.c
+++ b/drivers/mfd/max8907.c
@@ -20,6 +20,7 @@
 #include <linux/slab.h>
 
 static const struct mfd_cell max8907_cells[] = {
+	{ .name = "max8907-adc", },
 	{ .name = "max8907-leds", },
 	{ .name = "max8907-regulator", },
 	{ .name = "max8907-rtc", },
-- 
2.53.0

