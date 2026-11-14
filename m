Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.54.127.133
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794626757;
	b=28B80Y2KfYEbB8mmUIcuzTAh+cPyRIAjepYU8/6P53xIRmHxdeg9XJfefVOq5MOGpaEb
	 vKSIZwUVrkUBNzJpJIu5RjWeIigH0yj8etOLCUTTY+ebr4rvIACYLGAu89B63iiYCX0P2
	 SP5tU+0gQiy+/ALB5aaRUkcoU3MZ+ozIbsCpUhPByFgEGeSvqTSynLzA7VjSFFLx1XOq8
	 SddV0MChjS0/Nx1awjcGL+t3ZgTVJmY8goMGs4rPUsz4vRYy8g2yZH7GaJKLOVn8SuGa6
	 yZTUGwvCiYuhjANCa7WVcER1StxTyc60h3soPiRAPIHRLA3PdaKOaXuM7n2rqgD8FKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794626757;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Envelope-From;
	bh=xfUTCia5IOVaNssUiJmSZ2Oqcpo4Az+KCwWza/Lp86w=;
	b=Md5ufKn7g4PxehkYren8kD3kpyljQteTr/R0A8ZlDFKE5dXXZsH3gY/q0Yo1gLs6XTkz
	 Bmrid+MDcEqYAxIR5zH25OGz1p9K6DxmZBEz4iiupmCMT4aFY7KAshBFxW+LtOXXRgG2h
	 WwOxPkx7MD3tac9cYohX08F5/ump7fzsP8uEwx3k+s6PNnj/jfXR+OCDNse1a2sR7Azo7
	 Fyj482efZzAgU5snBipeslM15ACqdwElF2RrewetCXTK8BcaVWPlgPCSKfxu27rXvh35r
	 c4+LCJSPy9LQjAfBkYtEYlab52Rzo/F1SQL0a3qwmLuv5b5PryOjrxlsXfXMt471Pgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrispinetinega.com;
	spf=pass smtp.mailfrom=chrispinetinega.com;
	dkim=pass header.d=chrispinetinega.com header.i=@chrispinetinega.com header.a=rsa-sha256 header.s=default header.b=wItDagIN;
	arc=none smtp.remote-ip=198.54.127.133
Received: from out-2z4y-a133.jellyfish.systems (out-2z4y-a133.jellyfish.systems [198.54.127.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA8CE606A327
	for <mfd@lists.linux.dev>; Sat, 14 Nov 2026 03:25:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA8CE606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chrispinetinega.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrispinetinega.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=chrispinetinega.com header.i=@chrispinetinega.com header.a=rsa-sha256 header.s=default header.b=wItDagIN
Received: from mail.privateemail.com (unknown [62.8.90.37])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.privateemail.com (Postfix) with ESMTPSA id 4jRKJc2PrZzyNX;
	Sat, 14 Nov 2026 03:25:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chrispinetinega.com;
	s=default; t=1794626745;
	bh=xfUTCia5IOVaNssUiJmSZ2Oqcpo4Az+KCwWza/Lp86w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=wItDagIN3DkVpXnFhG71zTZdWaQT/Cesz6BvusY62PZXd5jlKLHxU5FkXHw4uqaOU
	 xium1HrqZ+7lmei40mKzXfegc/g8StOWxZjrobDrb6nKut/gEd03wBGDysLQpZUWqH
	 zhF1hu/b24cGvRC+utWAYa3PUaECFGSETOTwxsl0qaTGmPiImddttWg/V2xCbItm9u
	 RSZ01t3EoyWG/KjSeNkid2AkD4XtsDX/oc7uZyVhUp5IibqvV2QOmY1lt4dP/xj92y
	 gT6Khhbwrsr3RQoawFug8PKwfCJdSTpCz8HLwCxazMS5SuwfTzrupSvT/rRKk7jDr8
	 IGa41keE7IL5g==
From: Chrispine Tinega <dev@chrispinetinega.com>
To: Lee Jones <lee@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>,
	Tony Lindgren <tony@atomide.com>,
	Jerome Neanne <jerome.neanne@baylibre.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-omap@vger.kernel.org,
	mfd@lists.linux.dev
Subject: [PATCH 2/3] regulator: dt-bindings: ti,tps65219: Add ti,no-warm-shutdown
Date: Sat, 14 Nov 2026 06:24:55 +0300
Message-ID: <20261114032457.3434248-3-dev@chrispinetinega.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261114032457.3434248-1-dev@chrispinetinega.com>
References: <20261114032457.3434248-1-dev@chrispinetinega.com>
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
---
 .../devicetree/bindings/regulator/ti,tps65219.yaml    | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Documentation/devicetree/bindings/regulator/ti,tps65219.yaml b/Documentation/devicetree/bindings/regulator/ti,tps65219.yaml
index 7c64e588a..75f7ce45d 100644
--- a/Documentation/devicetree/bindings/regulator/ti,tps65219.yaml
+++ b/Documentation/devicetree/bindings/regulator/ti,tps65219.yaml
@@ -62,6 +62,16 @@ properties:
       where the board has a button wired to the pin and triggers
       an interrupt on pressing it.
 
+  ti,no-warm-shutdown:
+    type: boolean
+    description: |
+      Keep the PMIC running when one of its die temperature sensors passes
+      its warm threshold. By default, a sensor whose warm warning is not
+      masked makes the PMIC sequence all its outputs down at that
+      threshold. With this property the warning is only reported, and the
+      PMIC powers off at its hot threshold instead, so the board can run
+      warmer and the operating system decides how to react to the warning.
+
   regulators:
     type: object
     description: |
@@ -111,6 +121,7 @@ allOf:
               - ti,tps65215
     then:
       properties:
+        ti,no-warm-shutdown: false
         regulators:
           patternProperties:
             "^ldo[3-4]$": false
-- 
2.53.0

