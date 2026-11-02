Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.231.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793638231;
	b=dEymL7KNsgz8rBISB1le4JdwJqIczS+HvOy0oiUESYx6UG2hNX9TyP1KnaJlIq0BP8ka
	 9ozMuquKQkHFgP6MURdzwdtVCH8WUg5ORTTdjKFD2SXNUs26safQWs8fa1hKKgV5NqQJa
	 VG75wqCyIOIcnHilc/lUoiQVQv+gafRQqucpk9UvtgN9Nod1FIznv2dsGrJoYsgb5kfpB
	 X9OqEcTq2ylOgytP1vCmOSE0/Og2bazWhSVSLNF7JRcGPhPOCfpAq/imtM2/dVTy3I/YO
	 ogAzCeWtqzGXDjzo9ZEwcnxiMcOEEprx9eG6ZvJFjFdCaoE8pqPdq7xZmraVUAV6s0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793638231;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=KTg+Lt8n8cyfd+bzP669ss9gAVOsDYk15W0k0texwBs=;
	b=t44o8Y4lL4H/UZ0VXpRQvXZE2qa0axCCp5R408l3eqtCNNZdgBPXWsWX7MZsE3pXsEcQ
	 AGhyvz6rdcQ0NoRIruXX2Z1/3NW+u0cqzpluaYgNsCHMQa6+9nDOqxLJTRPj4WMxIXpv4
	 PrsvpXhCU5MfXpgezmE2IcSlPKe3uUs1SWtClvZJ9e5HwP1VhtBUxn0NV9Cez/BoctRRn
	 cHgTBVnTHF0C86yMNjNyIwqnyAaBWzn5Dfk7QP9M0R7KiCHTxKLlmZGAECSfYFGj3xEc9
	 sEkXfF4kUWhOxeOlHzIKgJFrkYeQg/5cNUEBl5MyyHgdBcMfStUdYCScpCJTPRr/cTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IsXp9Jiy;
	arc=none smtp.remote-ip=74.125.231.130
Received: from mail-oo2-f2.google.com (mail-oo2-f2.google.com [74.125.231.130])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AE7A6074646
	for <mfd@lists.linux.dev>; Mon,  2 Nov 2026 16:50:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6AE7A6074646
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IsXp9Jiy
Received: by mail-oo2-f2.google.com with SMTP id 46e09a7af769-84abe8ecec8so1367027a34.1
        for <mfd@lists.linux.dev>; Mon, 02 Nov 2026 08:50:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793638229; x=1794243029; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KTg+Lt8n8cyfd+bzP669ss9gAVOsDYk15W0k0texwBs=;
        b=IsXp9JiyDL3cQkGVOUgYd5VBt2QmrB80V8VLXYsanxtgKOlDm6UOydodhdk0VEq3sB
         LB6Jbb0jlK6E4OXYp0bSCAhKlm1+nyY4dAtbkUQppyJ+Nm7BhUL7xqX6YTuCakoRqrqd
         Bgn8GIF9woB8HD/jYX+yWsLHMawumwg2w4F0EJLnI32gx91Na5pLgW4wOMYKCN39Cqd0
         TXhcGaMmSsSoXemoIMJUxwcTTja86+5sDXISOoF1K1XqSH8wlQVdKWlZJZONzNuMs5Vj
         m2hH2XBP9tU3kIZslStFHdZJv5y1caVaD4Dri1gNmdjQ3Nsktc6dbdanvpY0zafHUUhT
         YAWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793638229; x=1794243029;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KTg+Lt8n8cyfd+bzP669ss9gAVOsDYk15W0k0texwBs=;
        b=MSTLZZdfVBojdh+HNFJxsj7skGNdIiygCL91fUdvhv10azKnWTrkLlyJO5vn1fUAdG
         QEO951jQ17hAkY97bGnrZSXpW6g7fPR4rsuvDc7uvL64vKITd6s13TGCpAQpMyMD+oyS
         skwsiAwUv5mFlydpdeW3CGNmuUAv17hXGpcu0PzkUSgBW6GZ7NyMyh/94eYK6ju7zb+l
         xwIuVnWxIdbg0K8hMEvLloGHAwJk+Ds13NB2Dpl34RtJpHONQwr9Dj436hdZIb65Ovt8
         QXfjHW1mdKT7dgoCtBYtqDaOK/l6anZsULRyd9vsOXcO7Fi3E0wqVYTNwOOjBUOY/8xs
         pJEA==
X-Forwarded-Encrypted: i=1; AKwUvBxi/wDbYtjY9hlMyJ0PUnIydU0u3jGTdCNXlcgFDRzK0uJRuNZ2iLClpANMO0WsFF3fvAI=@lists.linux.dev
X-Gm-Message-State: AFq9FYKced3DW3qVlGxeDgdir5bx5dCBEvvSXUeDEJSMJorwQY9t735S
	JFBT0sAQKRIroY1fZGcmnzgKmgqJTR4dGOeJ1P9ChMMuEU688p2Etb0Z
X-Gm-Gg: AYBFou228ZY5ssJXt74w47J+WfZWCDfSpuSBNybGpMr4fibKAg92OXAO7tcwb8wKwet
	O3NWYkFOY45W+YTtuPS9g9fCSLQYKw5pU/+G1/3CPsOkSVDASamrVNa3L+cHCGXiOS43vpVsOEI
	qdpPJ10qDTQz8PuZ/2pa/rvwb+mX4CboKiZ81vAnZCeS2EtOrMGJgY53LRi/GkpKVfBHnGlLFQO
	LegQsCE4PWRgfuTrXdN0zguWDr9oIHHpC98s9wrQdHtSSJIRCqElbIgHbS+cmRcADtbFgZQRihu
	WPBjHRgSiGRIeiESxgE/7zedmRET91mQDEYz6PQKZsvnyTv5o6whgVGWGO7+5mvat/1NOKQDN/D
	HLfk/2IghhftjEW+w4EA1NthQwzB7ZXIGmFGGdBejbY1Th0pp4axSDQ27Gqu5bAhzDLle/rm9dT
	dnkzx+ygy2XnhA8bTWYO+zjdWW2eFRnPH8wrgmx8/q81urcBNbYuxRvXIwxWba4zQ1uKn3CjLkQ
	R1J1h8pZxucppoEJl+vb8Lt7Qyg5OISIVLJEFneB9R3Xadr63hpnyxpXDCXgATzU8nwZQYgo7Yl
	9QSQ+AqCJP9FpF0ZpbXVu4HE1pkOndohbRR6liUFpyKZ1+NSXqm7e+5gVlTxv2mbebhfsnVVUw4
	nedRoXEuDDFm7d4AdHLI=
X-Received: by 2002:a05:6830:4487:b0:843:b6f8:de3f with SMTP id 46e09a7af769-85d365529d5mr7247305a34.18.1793638229426;
        Mon, 02 Nov 2026 08:50:29 -0800 (PST)
Received: from [10.10.18.223] (wsip-64-207-253-118.tu.ok.cox.net. [64.207.253.118])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85d354985cdsm9936779a34.10.2026.11.02.08.50.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 08:50:28 -0800 (PST)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Mon, 02 Nov 2026 10:50:21 -0600
Subject: [PATCH v2 1/2] dt-bindings: mfd: mediatek: mt6397: describe the
 RTC's 32 kHz output
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
Message-Id: <20261102-rbrue-suez-upstreaming-mt6397-rtc-32k-v2-1-19ca72815374@gmail.com>
References: <20261102-rbrue-suez-upstreaming-mt6397-rtc-32k-v2-0-19ca72815374@gmail.com>
In-Reply-To: <20261102-rbrue-suez-upstreaming-mt6397-rtc-32k-v2-0-19ca72815374@gmail.com>
To: Sen Chu <sen.chu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Macpaul Lin <macpaul.lin@mediatek.com>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Eddie Huang <eddie.huang@mediatek.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-pm@vger.kernel.org, mfd@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-rtc@vger.kernel.org, Ryan Brue <ryanbrue.dev@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793638226; l=1237;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=3CyHV7hxEQyK84ACcArH+5qoJrY2fIpfuKy4fIAGdtU=;
 b=0Wf1b+8NmB4OEOpczcJRUHMeGyBxsbhLHqpUCilWHGZgwVqtkqscNpMc02ashPTcWUbtr4lgH
 WpE9hQMgNpfD6tqblyH80VYcqOYLALDE/Fh5XCg6akXUTVKecaowEVt
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=

The MT6397 RTC drives its 32 kHz clock out of the PMIC, where boards
use it as the sleep clock of a Wi-Fi/Bluetooth combo chip. The output
is off unless something turns it on.

Let the RTC node provide it as a clock.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
 Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml b/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
index 055625362951..3bfe1ad60d2d 100644
--- a/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
+++ b/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
@@ -84,6 +84,11 @@ properties:
 
       start-year: true
 
+      "#clock-cells":
+        description:
+          The 32 kHz clock the RTC drives out to other chips.
+        const: 0
+
       nvmem-layout:
         $ref: /schemas/nvmem/layouts/nvmem-layout.yaml
         description:
@@ -694,5 +699,6 @@ examples:
 
         rtc {
             compatible = "mediatek,mt6397-rtc";
+            #clock-cells = <0>;
         };
     };

-- 
2.55.0

