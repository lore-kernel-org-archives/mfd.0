Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.54.127.153
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794855549;
	b=d5DIYdaX1p2BYu3qbF6pJleuNozqWM7lf634zhoGxuwoCB/qHfd7eV3LE7PcXtcXayHa
	 dEW9TetHEM/4RlwYXx/NbhdkIP8CmMLzHfHY9XZVT0rELTvOyflKEv5emUedBVgUcL0En
	 bM4AGiam3b6LWu3V+MCeAfYyruGf4QnEDMf0T38zQc88gSjYDjtPG0cVt64wdEveO5LtV
	 3eOnv1W295FsZWiL+CfhsDiEiDtx/sWmmtwCq6brhdrkEEtPabjLFw+FqofeyTLII90KB
	 8z5nim7kTZNmUMpI23DVukNkstsMwiqvVNvRXghXEeAHOpWNLkuApCmFfNw4tE8R3BA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794855549;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Envelope-From;
	bh=DK7rAJeeVuC12S0k4TlkESuVpREnuDD75LcwYqQQc4A=;
	b=4jstSBZHboQaDCxejqbfwsjhafNXPQQJEzD0obF3fvmigG7hxPkoftcVd6vuSuEyX9q9
	 otYWJ9OZndtMUhJ5ZcTt/8LrsILpMv88tJMmQLjNPF9RtTjQDFlpJaPu0Jtlol2h4qtVe
	 pl0qFZSxMK7rWXTc9Cu24yMJ4oQDV1AG4YsSkfWK1QKBhkTdSa6hmT/Dl082YCQ5nn6Bm
	 JqRX54WWhvDaBtEpOqdJY4UKsu3EY7R5Vs3OyonH01sXjgOHoIF/cgA6Mz9BnkW1vYZy8
	 Mql9m9Xw5ectR7PlIYCz//qXR5AK4SOe9pBq+di8VsCP8sDd/toVA3o4hGdRVrULZ+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrispinetinega.com;
	spf=pass smtp.mailfrom=chrispinetinega.com;
	dkim=pass header.d=chrispinetinega.com header.i=@chrispinetinega.com header.a=rsa-sha256 header.s=default header.b=va3d5GZ4;
	arc=none smtp.remote-ip=198.54.127.153
Received: from out-2z4y-a153.jellyfish.systems (out-2z4y-a153.jellyfish.systems [198.54.127.153])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9845D606A890
	for <mfd@lists.linux.dev>; Mon, 16 Nov 2026 18:59:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9845D606A890
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chrispinetinega.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrispinetinega.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=chrispinetinega.com header.i=@chrispinetinega.com header.a=rsa-sha256 header.s=default header.b=va3d5GZ4
Received: from mail.privateemail.com (unknown [62.8.90.37])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.privateemail.com (Postfix) with ESMTPSA id 4jSxwD4jPsz8sWV;
	Mon, 16 Nov 2026 18:58:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chrispinetinega.com;
	s=default; t=1794855524;
	bh=DK7rAJeeVuC12S0k4TlkESuVpREnuDD75LcwYqQQc4A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=va3d5GZ4GbSpPHzt6j0UbWFOQmEG3BvhuykbnL6qXZVI1HHXqAV1CXWReXUEXds6Z
	 Un3nJ5yCnOkQAWeBK4RkabE9IbcdogOs9dli7h0i9qDlb000pO8yfhkm8N7K0nXadW
	 v3KyMw7FMTQYOkn40Ef/Hd+uN2ubqEl/33MUX0HwliWgBMaZa4/wwlUZTcONOhTIim
	 bKcllkGWPv+X3KCptI7LSIjnzQIY42N020oSnrUCnt3sT4J31YcZwBiXblCJHm3Nh4
	 MpdARfWck0okOQDxonqSJCdj4U4aZR+8VnjA+jY82W0622gO+BHTSGqssMP7vyspJS
	 9brIkZybFqkhw==
From: Chrispine Tinega <dev@chrispinetinega.com>
To: Lee Jones <lee@kernel.org>
Cc: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	aaro.koskinen@iki.fi,
	andreas@kemnade.info,
	khilman@baylibre.com,
	rogerq@kernel.org,
	tony@atomide.com,
	jerome.neanne@baylibre.com,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-omap@vger.kernel.org,
	mfd@lists.linux.dev,
	Chrispine Tinega <dev@chrispinetinega.com>
Subject: [PATCH v2 2/3] regulator: dt-bindings: ti,tps65219: Add ti,no-warm-shutdown
Date: Mon, 16 Nov 2026 21:58:10 +0300
Message-ID: <20261116185811.1907811-3-dev@chrispinetinega.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261116185811.1907811-1-dev@chrispinetinega.com>
References: <20261116185811.1907811-1-dev@chrispinetinega.com>
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
X-Envelope-From: dev@chrispinetinega.com

The TPS65219 has four die temperature sensors, each with a warm and a
hot threshold. A sensor whose warm warning is not masked makes the PMIC
sequence all its outputs down at the warm threshold, 110 to 130 C.
Masked, the warning is only reported, and the PMIC powers off at the hot
threshold, 130 to 150 C. Whether a board can run past the warm threshold
depends on its thermal design, so the board's devicetree has to say so.

Add ti,no-warm-shutdown for that. It is allowed on the TPS65219 only:
the masks are not described here for the TPS65214 and TPS65215.

Signed-off-by: Chrispine Tinega <dev@chrispinetinega.com>
Reviewed-by: Mark Brown <broonie@kernel.org>
---
Changes in v2:
- Drop "so the board can run warmer and the operating system decides
  how to react to the warning" from the description. Nothing acts on
  the warning today. (Mark)
- Add Mark's Reviewed-by.

 .../devicetree/bindings/regulator/ti,tps65219.yaml     | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/regulator/ti,tps65219.yaml b/Documentation/devicetree/bindings/regulator/ti,tps65219.yaml
index 7c64e588a..22aea7f61 100644
--- a/Documentation/devicetree/bindings/regulator/ti,tps65219.yaml
+++ b/Documentation/devicetree/bindings/regulator/ti,tps65219.yaml
@@ -62,6 +62,15 @@ properties:
       where the board has a button wired to the pin and triggers
       an interrupt on pressing it.
 
+  ti,no-warm-shutdown:
+    type: boolean
+    description: |
+      Keep the PMIC running when one of its die temperature sensors passes
+      its warm threshold. By default, a sensor whose warm warning is not
+      masked makes the PMIC sequence all its outputs down at that
+      threshold. With this property the warning is only reported, and the
+      PMIC powers off at its hot threshold instead.
+
   regulators:
     type: object
     description: |
@@ -111,6 +120,7 @@ allOf:
               - ti,tps65215
     then:
       properties:
+        ti,no-warm-shutdown: false
         regulators:
           patternProperties:
             "^ldo[3-4]$": false
-- 
2.53.0

