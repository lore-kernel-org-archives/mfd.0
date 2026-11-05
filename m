Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793888248;
	b=ABHTL1JSlZ+NaXe67iE9s/kwxkad0dlghuf/JHeiFEiZvGStUZeoIw6qAvhdQOy8rXBl
	 Omx/xTIKKa9OYErJ2u00sGowiCAmfvqmMa0ruNc4hcvZ3K/fVklPAt53SJ/EIWPbZv+r+
	 ALt1lDmdAgHX3L1eaJBjDBeEeINfe2KXMNUstAenlZ0k3pUVlC5bP4NqHu2C7daqkyr/M
	 NKofWaeEsUO1SwzxIU9nEmoiUV/GSNwRqXSk3mfMIZoXEfCjpesM6h118N96EOJFSEnT5
	 1X9JTtjaU/B8+8D/P0d5AGpe9xwPhbHiThCxWOqX19Sq47o1BGWtrAJBRy87Q4aUL1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793888248;
	h=DMARC-Filter:From:DKIM-Signature:DKIM-Signature:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc;
	bh=iBP+b6prP6kyCPScuNa8zQ2uYPSjomx3LSDLJkMRsj4=;
	b=Jq57kIv39bhGrBykc/KMIhfk3npXm0i8a1j6cJ5zb7SchJKZhdyph0AADtB6ePE2Zb2o
	 0AaER6z9noaiyq+0k9tpZmRMfBLDPnupdLEo2O8Qe5DwBlU0Bn3GyxwSsW8+39p0oy14O
	 rQRZ8K5t4gV7bjN1D7qEAJMS3OxIoEnVpIVMTHBCn6u0++k7XLQah8+YTRE6+HJ7RdD48
	 Aa8lf7XEQrMgq/yq67IrrYLThFkP7ltTGnUYu3FyG/PJzP1N062s1p64rCjAEbBBV7Qau
	 lbPQnZue+RCYF+A0XXCfZ75K3FGvl297zJvFGYTjkLp3kJbm9GWmg2LLPiFPMxxYsIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=OI4Gz62K;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b="2tj8U/8w";
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C678606A31B
	for <mfd@lists.linux.dev>; Thu,  5 Nov 2026 14:17:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0C678606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=OI4Gz62K;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=2tj8U/8w
From: Vasilij Strassheim <v.strassheim@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1793888246;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iBP+b6prP6kyCPScuNa8zQ2uYPSjomx3LSDLJkMRsj4=;
	b=OI4Gz62KXEPlhBiFiNBdlvkJqtOFm+oP5wedOTzxgUi3ixBjuDEZ27GboXZbDwjUl6DyMB
	GmZTBR6rZwwGRQEwsD8oZ4DUhvR4hiHJLeRaJgkOUDkUGVjOFkVr3aghANwDxMIM5KRK3n
	csz3J7teXT6r8TkbsJ9Ocn64bExLO/HA7Sfo3FkUbWOXtYF2fLI7PFFMtN67LZDUNX3ThH
	Ka7mlWmv0uCeLNNUzmxhqPQO6BoYW7fWjqnbh4tPjIpGjLNrHHGRpnBAduJq/Ju0+XzH0k
	Hlvk+NI5PCWYUk2fcvbKESXeMvOqvPnlCK0yHh+0nZnc5cz2fCAej8VJZU7e/w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1793888246;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iBP+b6prP6kyCPScuNa8zQ2uYPSjomx3LSDLJkMRsj4=;
	b=2tj8U/8woslDp+1Wy7NAGBItta3NCXfzj8cBvhOJYGOKgIfh2/x/8e3dAfLg+EWHQadUgX
	WF15C13RESls7pDA==
Date: Thu, 05 Nov 2026 15:16:45 +0100
Subject: [PATCH net-next v4 1/8] dt-bindings: vendor-prefixes: Add soce
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-devel-vstrassheim-soce-dsa-ml-v4-1-02f3cde2afa1@linutronix.de>
References: <20261105-devel-vstrassheim-soce-dsa-ml-v4-0-02f3cde2afa1@linutronix.de>
In-Reply-To: <20261105-devel-vstrassheim-soce-dsa-ml-v4-0-02f3cde2afa1@linutronix.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
 Vladimir Oltean <olteanv@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
 Russell King <linux@armlinux.org.uk>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 Heiner Kallweit <hkallweit1@gmail.com>, Eric Dumazet <edumazet@kernel.org>, 
 Lee Jones <lee@kernel.org>, Eric Dumazet <edumazet@kernel.org>
Cc: Vasilij Strassheim <v.strassheim@linutronix.de>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 netdev@vger.kernel.org, mfd@lists.linux.dev, 
 Martin Kaistra <martin.kaistra@linutronix.de>, 
 Benedikt Spranger <b.spranger@linutronix.de>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Document binding for System-On-Chip Engineering, S.L.

Link: https://soc-e.com/
Signed-off-by: Vasilij Strassheim <v.strassheim@linutronix.de>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 5471a06f93f1..20a850a6e86f 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1599,6 +1599,8 @@ patternProperties:
     description: Standard Microsystems Corporation
   "^snps,.*":
     description: Synopsys, Inc.
+  "^soce,.*":
+    description: System-On-Chip Engineering, S.L.
   "^sochip,.*":
     description: Shenzhen SoChip Technology Co., Ltd.
   "^socionext,.*":

-- 
2.39.5

