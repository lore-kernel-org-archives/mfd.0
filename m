Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794733894;
	b=W8sr+xh6d21yODpWmQqFVysdc77QcLZJaiEVpq/noskRy4PDUbZqnBC0XI8DrmvMrC8M
	 KVEG3kw/vE/t+BQRgH7tB4yJWRp0+21rWwLwdJVYvveLOzuLMF7HPEpDgHiZNQsSg0Fvu
	 0r5BSV0HpUGcsz231cjzB5f2Aq87/ySMM/DQxIfGBobuFBlUv9l63/b1mYPuxU5ApHP3O
	 h9Hd0jxtHq64Tvzw9T4oJOn6SqT7Is8UOoj4PQS1yyLyXtV2DOsP2qD4cUbNs7KzaFPAj
	 FuHBn2o9UUBU/GQvSoDnLSmGh28tjOPPqwSMvcolgcoUyxY02e04Pud8QgmI8anhzoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794733894;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=KvSzSzK4RKteaHZ6/hsaC8V/11ClDZu+swGpFBPSid8=;
	b=c/MUMRUO9d8V7GVscLzknrPK6LeztveYSfXjUHL0NnEXyVu13EAR1+pUGvgyHzBp0QoC
	 9n/+wehwUs8L5G4Nf8Ety9t0nxVxRXkvtvz5EKWaVX0BVZyXBQ0qyFR1W69zs+jP04Hlw
	 SfAERN+A7KA3e0xZ6SS8zDG/9aMMyrYIMRpuLoe+7wohuQWIwcd+YYZAVMX4WTXhdNcQl
	 uMxJdB0MY9GwLnrkRaIsR73OwA/MJq/tVkN8ZmFP4Ds2TULP0cYHvgtrb78Jii1SRAv6k
	 YkOezoJxIdccIQHmVcE/r2ushwqWlgePjWVhbJVuNFMvHDXLMJWN8igDtGuUrOZ3aBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DJUovdDi;
	arc=none smtp.remote-ip=209.85.218.53
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2A7B606A337
	for <mfd@lists.linux.dev>; Sun, 15 Nov 2026 09:11:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E2A7B606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DJUovdDi
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c40f29667e6so454765466b.0
        for <mfd@lists.linux.dev>; Sun, 15 Nov 2026 01:11:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794733892; x=1795338692; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KvSzSzK4RKteaHZ6/hsaC8V/11ClDZu+swGpFBPSid8=;
        b=DJUovdDiQv2tgv8aVm+9mXgBJ7zwWIgn7GXM+Sf1CxtN2XIBPzYvYoQm0hU/ipKNSZ
         yDniqucKndSCNHN0ur4FSgwP8zyJrO5ztSsAjZuNoLvUvj+/U4wuX3N/uC8+EeRFNrgs
         JosN4P1acGeMathLCbsAmWwkMHfm1DPJuMp80W24HB+H1fr3QW2ad7B2cU4WWENPN7PE
         Ecj92PCn32/XkInRGpJaVRKTqgZ7q4oPo0AoAljVsSEBuB0se1aPgW7VZsSA5z2LruHL
         KSgE8AFsZ5UO0eJv5JyL2S0YjglvI9tDxuTjqGSp24spxrvulrD7kzz/TjoOpjd9xqTe
         192A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794733892; x=1795338692;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KvSzSzK4RKteaHZ6/hsaC8V/11ClDZu+swGpFBPSid8=;
        b=XT1W/Xj0RBFKuw7sk0S52t5SVziHMSPSEnrdxG82zvWA1BPnlFkwS7eP48H4tHssYl
         XBsKn+/SX2g7WP2nVbUvfaaS/357vn87a14QyLCsNNkgKkUXZHKAHj/jACip5ziEy1bJ
         jc60aRZaPhM1fByvCTpwQgr8HrhDOix6+W/e+HuTyixW9BEFlg9dSD1HcpPQoKrjGyjx
         9OMz6jE2zq24smpdF8s/fhmViRMCUUbi08dHU/cDZyLqNsKrSqLxPf8u/aQhkH/sheD/
         s9qUi3QhC+gw53DVGlXuvXoePv/dwJHCGzOCCsgKHBMmZ5lNEW5kGqLGePiu655RWl3n
         NYdw==
X-Forwarded-Encrypted: i=1; AL+hErFblGJn8vIjP+AKYrYT/EkmvEVhLrAIY53+kNviHl1rYDd+xw9dVFvvvdDByGtr/3/sjiM=@lists.linux.dev
X-Gm-Message-State: APuU4Z+/R4+acIDQNz7TD8NQDTfTbgQeJD4TluPAis9o+yWxpE/ZA+60
	6aadtlsmJ13Xp9xHVL0vd1u2FBD9dAGlA3B1dQtergxjmiBYku3h1pMa
X-Gm-Gg: AYBFou2V8Na83rtE5TGOxYufNYW9jC5k5/J9U9FiyJ5x8NwVbvyT6pjdNA1K01NbLs5
	RflIPcRbeOPJe+ciuniOh3TQzgoZGbiRpljh8icXxD5sVZS4RUZioMF9jVSVtP3zIDklQgcILv3
	xqWkCtGZETPiBQk71CEvKDlvAQvo2MeSFY6K4sTdVrknnk84H1Ygsg9H9W8IOldUu79u29GQg8B
	eM4bXGEpkvpxlcZfUiK7J6NhPdBpXrqPx5YXGjnb2cPEt8RPfQLbF6THSslZQloRaKCQMQ1pKHo
	c6gEQPAyIcgVts9AwcgGr44gBQJe7kfcjNdvPi5OjQ1DbLKKTFVFVAlAeYwa77sYBsJVld5qTQ2
	7WDSwoG6BC2PgVTiMkfIMdFZDXV534M81Kv72o4knzrk7/HrJO1JoejJXQPJ4gwoOR6m1QBMKLI
	5Dx+RZA4UflAqAXn42GlYi0vL9jmzty4GQoY7WqJLg6ajXccrGybbRKZnTU4+TrSHfp+cBmsGAR
	fujyb6Ihicoqu2nuk3pqGwDpkw/nKPTA48RsjIlZPzlNOsKxML8DmGgl6Ad75H3470Fc3qHB3lI
	U26BwNhm5e7Z6xdTo8ei/vid04AESoz+joE+EgRBwRgeMIRM04LfQhqwzTfH5oLSD5OxZSaxOf/
	+HfuBEremIQ==
X-Received: by 2002:a17:907:8e08:b0:c31:c767:ae0b with SMTP id a640c23a62f3a-c5095db2440mr698968966b.0.1794733892245;
        Sun, 15 Nov 2026 01:11:32 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b3dbaesm289392366b.32.2026.11.15.01.11.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 01:11:31 -0800 (PST)
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
Subject: [PATCH v2 1/4] regulator: dt-bindings: maxim,max8907: Document io-channel-cells property
Date: Sun, 15 Nov 2026 11:11:17 +0200
Message-ID: <20261115091120.108684-2-clamor95@gmail.com>
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

The Maxim MAX8907 has a built-in 8-channel ADC. It does not require any
Device Tree-based configuration and is folded into the main PMIC
node. Document the io-channel-cells property in PMIC's node to be able to
request channel data in the Device Tree using the phandle of the PMIC.

Acked-by: Mark Brown <broonie@kernel.org>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 Documentation/devicetree/bindings/regulator/maxim,max8907.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/regulator/maxim,max8907.yaml b/Documentation/devicetree/bindings/regulator/maxim,max8907.yaml
index ee1a305d1c210..ccdeb9ba21e26 100644
--- a/Documentation/devicetree/bindings/regulator/maxim,max8907.yaml
+++ b/Documentation/devicetree/bindings/regulator/maxim,max8907.yaml
@@ -27,6 +27,9 @@ properties:
 
   system-power-controller: true
 
+  "#io-channel-cells":
+    const: 1
+
   mbatt-supply:
     description:
       The input supply for MBATT, BBAT, SDBY, VRTC.
-- 
2.53.0

