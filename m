Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794284667;
	b=LjQPAWVHU1hYngU0TG+8fHxp+z/unOLHK3NaTiKvU935AtE1JUHveNPrckUJbTupoZ6a
	 1OBJPDkpMjLAfNDNPnrPBdyuFK9AgxoT0NXaLuJjkGXn0r4MUXGeYSwy5t7iwLTcOnh2m
	 5kVu+s52GmzKwBX6rLLTPv87VKkjM+Kpyp2qxeO2i1T9Xcm9McYjbjG5uCnoJX8HH32zc
	 cfUnw2If4edUxonFjbzl44SJRvJjhfaw0SM/bL161IdIDMPU5NkcsNwu5fY5oPFmu4+fw
	 6rK3nV/ISNaLwge3Y9W+EG+vBpsESgx/NIJC8JCE8ptDGoUhqaDQ6ARCmJII9jUnOtw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794284667;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=sB+qucsTWzR2GT3huYaY7Vowbb5pb353bAlTMET9Yqk=;
	b=3l6cLupcqivsQj4PZF4inWmIm4YTG0DhUOCAGkoaQ40hOwp9XCeCNXmph2dy22GndUv3
	 h/O/oJEzoPi1xw6zREKNZbXSrO/xMx3oiZAMMTsqQCdkfZQicMdbrxJdZl+hfs1YIIEBA
	 fBzMLOSYBWoEvHeyb2INq7ZUnN+oXpJvOVYbmtF9kvUFWbERJCO/OGhhTFm12TclQ9HJt
	 X94aOsLwBKuNLCwduwYhqqdWCIZ1ElGVOsdVCHYO6pT9j0ZNfooangQtZBiZpl4Zxcquv
	 FCLr1rvgOHMctKc4D4GDuGsf7mmsJGrnmbfWpZ3V0+ZpJO3cUT6QCnLw1VQotV/cLoQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=jclark.com;
	spf=pass smtp.mailfrom=jclark.com;
	dkim=pass header.d=jclark-com.20260707.gappssmtp.com header.i=@jclark-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=OUj+p2CF;
	arc=none smtp.remote-ip=74.125.82.42
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80F14606DE69
	for <mfd@lists.linux.dev>; Tue, 10 Nov 2026 04:24:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 80F14606DE69
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jclark.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jclark.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jclark-com.20260707.gappssmtp.com header.i=@jclark-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=OUj+p2CF
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-1b244fb7fffso2027542c88.1
        for <mfd@lists.linux.dev>; Mon, 09 Nov 2026 20:24:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jclark-com.20260707.gappssmtp.com; s=20260707; t=1794284666; x=1794889466; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sB+qucsTWzR2GT3huYaY7Vowbb5pb353bAlTMET9Yqk=;
        b=OUj+p2CFeUt3PCGryEQYO4lAzBk23MztrLfHYfaVyG8s7qo8DNmzx6x89K+pAt6Qdx
         9JvlK2jzqoQFEDF1a3s4iDFtxwinfP1lhBlRFcJcjsBLdTK/n6TIx5R54IzTgKGTeFfZ
         RPXb6n4RYjPr1i30CNoN5NAB6VcT7bN5cysmmJQ50h1ixkstptjZ9caG/l4Mpjs64G7p
         7D9NbVwg0WX9CWKnAMHbjaLQ3tPmNuRlq4NtYMT7CK2+r+4Z2L7Jg0hrLkpqY9RBr3tz
         Q08NBytyeuvCCP2LJzspcONwFHqvH6L01ilazE1igqHt9emlh6sCdtsWPnsoKf07qMJ+
         1goA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794284666; x=1794889466;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sB+qucsTWzR2GT3huYaY7Vowbb5pb353bAlTMET9Yqk=;
        b=NmZzsEDiU2l3jHK5kpS9g1EdOpIKM/cOYtrc1VSpkQu9T6EdAdm8Gj6h/kuMj2zrWg
         WYXyq0xjEdErH6GCb1n/yw+2K2zL95t5FSpAn66Y0FRZUaYtXGxOGQPXip05gOfOB9eD
         aNgQuIxGDyqzjVDVMXf16MXZLnkQxzybYSmvZ0t5ADc5E7tLSMfRj5tOPHukJ4ldiQ5q
         U7VqdFu/4jmAmHthJ9MeHdggyusWXh5x4Vcy4S+9DtY92MfWXjnMtL331tzfJJuSujsl
         7sOLFrsTKZ1G/+xTp0m/27dt3y3m9MMGbKQsBvDYVfJ5a8BXVfGchn/olJ/dVZT9ymsG
         xGYw==
X-Forwarded-Encrypted: i=1; AL+hErEfpwTQFhhrRch/CE8/PQJprL9MiU3eziSmVHM972yP9050/fTkF77fhiRQUsNzX0fK9Qg=@lists.linux.dev
X-Gm-Message-State: APuU4Z9OyNJTbiHDvYNbGStXw9iMidhLCjfqtGpnECeOdR94bd2JmFtf
	i5c722vxVm2Pl/x2blY4Vvje/6pmS/UsqSFDkV4YoLf/SKnIZxL0E0Sq4Gi/MzF/vA==
X-Gm-Gg: AYBFou3MpU9gzE+eVW2Xc63Cy7chAVnLPKZUIMCyisJPXGpjeKngXHQ2OSmDW1/CrDA
	l8NFDnhJqNyLPX1VGWDpVyyxbxFMhr+RN2w2CcXFsn3YCkdrIgo4O/iVUrjw/+SCQOY5vRTZgwi
	aSe1frA47Hd3KCHhOXz1fowBA+9faYxqc+dSEqKMk0EuiPnBcUokAIWBN9bpl312iP134i9egR+
	tod69UuxJV/kN9AGKHeZsBy67WCdRMHuQxWmWTaB7XUJCailyKqmBjlqwc+zMKJJvkdrZcpfpNU
	tl0SsF/M6QGdLpi/WZRrDAJrElmemX3uoacRoQ3KWxqsw3wHXBxQc2fqvXWxUTOVoKKwTGFukgG
	vWtAlSz1ZQlmrzkVafmlSWxbU7utHvIgNsCu3jX5c1431hUWGsYyq1ymRVwjr/cDmKfk2oQMbaz
	P8zRDL4B5R17taozosDaCBtq1xpFr+BjE7/8OttWc8FrnsHi9lv16FhFq24myPYajwOku4Dezr+
	3or9RrNommw3ZMwJskQAdlTUHIEy+FaiP2hhIDTZFd2JirG4RBdCn90s+cod7sXrFO9YhuT2GLS
	A4kUCPpxCsSQJxGb5yly4BcGFTXrtokY9CuLgj5MsFqh2niFdAnFJNw1lbePY2TATHLX9gQ3hOF
	zdUQwWyd1d9etVC2J
X-Received: by 2002:a05:7022:927:b0:1b3:a22c:7f68 with SMTP id a92af1059eb24-1b3b60094f5mr2444679c88.29.1794284665400;
        Mon, 09 Nov 2026 20:24:25 -0800 (PST)
Received: from cantal.lan ([58.136.75.91])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3751fe32276sm3116950eec.8.2026.11.09.20.24.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 20:24:24 -0800 (PST)
From: James Clark <jjc@jclark.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>
Cc: Siddharth Vadapalli <s-vadapalli@ti.com>,
	Roger Quadros <rogerq@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Martin Kaistra <martin.kaistra@linutronix.de>,
	Vadim Fedorenko <vadim.fedorenko@linux.dev>,
	Rahul Sharma <r-sharma3@ti.com>,
	Robert Nelson <robertcnelson@gmail.com>,
	Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Chintan Vankar <c-vankar@ti.com>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH net-next 2/3] dt-bindings: net: ti,k3-am654-cpts: add ti,gtc-push
Date: Tue, 10 Nov 2026 11:24:02 +0700
Message-ID: <680b4e98af630c4759dbdf73b53926ec5f87fc3b.1794284248.git.jjc@jclark.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <cover.1794284248.git.jjc@jclark.com>
References: <cover.1794284248.git.jjc@jclark.com>
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

The Global Timebase Counter (GTC) of TI K3 SoCs is the system counter,
the one the Arm cores read as the architected counter. It can export one
of its counter bits, selected by GTC_CFG0_PUSHEVT, as a push event
output, and the Time Sync Router can route that output to one of the
CPTS hardware timestamp push inputs (HWx_TS_PUSH). The CPTS then
timestamps edges that fall at known counter values, which gives pairs of
CPTS and system counter values.

Add an optional ti,gtc-push property giving the GTC CFG0 syscon and the
HWx_TS_PUSH input the push event is routed to. The CPTS driver uses this
to write GTC_CFG0_PUSHEVT. The router itself is configured separately, as
it is for ti,pps.

Signed-off-by: James Clark <jjc@jclark.com>
---
 .../bindings/net/ti,k3-am654-cpts.yaml          | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/ti,k3-am654-cpts.yaml b/Documentation/devicetree/bindings/net/ti,k3-am654-cpts.yaml
index 3572749147fb..7bf5bedc2b9c 100644
--- a/Documentation/devicetree/bindings/net/ti,k3-am654-cpts.yaml
+++ b/Documentation/devicetree/bindings/net/ti,k3-am654-cpts.yaml
@@ -101,6 +101,23 @@ properties:
       The pair of HWx_TS_PUSH input and TS_GENFy output indexes used for
       PPS events generation. Platform/board specific.
 
+  ti,gtc-push:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    items:
+      - items:
+          - description: phandle to the Global Timebase Counter (GTC) CFG0
+              syscon
+          - description: HWx_TS_PUSH input index (0-based) the GTC push event
+              is routed to
+            maximum: 7
+    description: |
+      The GTC is the SoC's system counter (the Arm architected counter). Its
+      push event output, one counter bit selected by GTC_CFG0_PUSHEVT, reaches
+      a CPTS hardware timestamp push input through the Time Sync Router. With
+      this property the CPTS timestamps that signal to provide hardware
+      cross-timestamps of the CPTS and the system counter. The router is
+      configured separately. Platform/board specific.
+
   refclk-mux:
     type: object
     additionalProperties: false
-- 
2.56.0

