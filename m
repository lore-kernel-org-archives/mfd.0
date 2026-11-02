Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.231.132
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793597637;
	b=Vjq9eJd3Qz7T1q6F6l/zIOL8FW1K/OUz34bxa/MPUA67O9XKyNrb38bwwfWrSjiThdyC
	 YyyLJcDQGUtPu+8FX77r6m/NyD549NDjqJ6jeEqg1Lqki2INle2/ZmZ9AgICv20CzbEAs
	 mQmEOhbZZzswRueTAU3yjYpnhVaYju+SsFLrZdwTUyrqAK84cRSFeYk7GijAdxhYSn+S7
	 Xb5O5AchNEaJfhw071WSMq5w+tpejp+JocFX4PSFfA14MBO69VeRrBVmNaVw9v0RjfzAD
	 vubkLciliqiYWEOnKbnfw/3H6raktXV6I2t9ffRR7u+I6AK5XbLMZpmYp8L+pwPxB2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793597637;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=fzpgC5Iq6UmNwAV/YxFMKMcnuTBJ158cMfcPvMXN/0k=;
	b=k57DEtYcT7JsdwuyExs4vsFzFQgQu7jZpuFq7e2NQP+IXvIVU+98tvQ/C3I9f3CaraKc
	 mAqJ5IaHTuxkGW8Q+gIK2FRo4z4yNj4r17q3hGvHBeGqSB6r/IXSdep+XB5/sG1BzFhmw
	 VRfWXBPN3k3MTR8lYqCsVsRq4Bk1MKmmFOQkarfX9nXE0dLhxxv1r3vwdzpx3Grhhd19L
	 PYQwccK/VMaoM9cMX/0Tnfj0GBytHhwoiTUBjbPllGhGFevPx0uRfSUxyCGs6HJerweXk
	 na5GnOhSDyZnl0MU4iDhCSTZsUVWCG2kzn0vlYwFNZ3Sb9zdI+hJB+5Ea1cBSIjdsXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=w97k00Om;
	arc=none smtp.remote-ip=74.125.231.132
Received: from mail-oo2-f4.google.com (mail-oo2-f4.google.com [74.125.231.132])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12BD9606A337
	for <mfd@lists.linux.dev>; Mon,  2 Nov 2026 05:33:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 12BD9606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=w97k00Om
Received: by mail-oo2-f4.google.com with SMTP id 006d021491bc7-702f1150a16so316434eaf.1
        for <mfd@lists.linux.dev>; Sun, 01 Nov 2026 21:33:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793597636; x=1794202436; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fzpgC5Iq6UmNwAV/YxFMKMcnuTBJ158cMfcPvMXN/0k=;
        b=w97k00OmSa2PqxhVJsxyrsLyp4FYWsLMCvgYphiI5dG1/4Pfxr1q4rNX3niDg4S9+f
         NJmdAiXYDJNSDPeua7LBi/LKCxmPmISevOvmY+n3nGzyJAfEKnHVbh5AsDBeYdD1d0Wx
         l20Nka9fo0AljfAfAu6HfKzkcYh40S5J0YwGfDcmg55fkyAGJYujUku/fkIIiaHe39Rn
         zA4UpLAbNmaMpy2NCABUGcWa6BRldHSfKmSHQWdnzU1NDfo9AdycSewDKGq4GawbeU/7
         Ph3sIkLHv9LipP+ICVkMuRWtfNy62dCC9RiNOmsUuMpKctv/THvcquv9JGkBWVUzR/07
         xdtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793597636; x=1794202436;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fzpgC5Iq6UmNwAV/YxFMKMcnuTBJ158cMfcPvMXN/0k=;
        b=ZjmZdZmjwDhS7kKrPcbfTfckF6hbUsflFf1De9abb/aMgUileohIp58acS88HgbIMT
         txEo57pS4EcFRXfOxXIeAHyRkKpBFp6/45EoNwcH/f5K/QWoN6Yjt3ZIgcYPlfippigz
         VVHXPgAnNwWtdu4mrI6XbT2EZacL/Bhmqo/YuQC9x3XuKq/LCub9p9c39qj7sjEPpdX+
         PbRn6ftz2WSKwvU9VXh+Mami3nLdRboY7mF07npNRrQDUSn66MJxZi9jzEZ2FgKMCDH1
         cozSsH+HmSWdCLhM5PfE/Qw8jQ7/NEbJ3+xvMJ3dNnW9SnmLbtETdSi4vxSfxN39i9PN
         79Ww==
X-Forwarded-Encrypted: i=1; AKwUvBySs3U7GTqqulcuF4tIOVYuQ1Hs0ldqGUXUy7siYFisahym3jeDrqEQkIit4HPgxH0qvt0=@lists.linux.dev
X-Gm-Message-State: AFq9FYLGeDvmEZDFFaATwFKpo/NzjuwMR8ECDlA6aM/8DAjhJd4DurWd
	N4edRKWkSCrTQkgjXT5e0oY3dC//Zr8hlhVPz+keG/pvmhTgDAEssLFO
X-Gm-Gg: AYBFou3HogZCXFukA86SGFKvuY7HN8dUKMoPUhMf3LT7dmvMbRwsaGCIjpI4qn/562Y
	3HSUvkQUdUQeNeMl6sjNhfEUZ3u2e4DL0SwKq2E77zxvWMHxl65SG2ni9catQID9aDKmYMfTGq6
	5JFB4GmRS12bgj44FnWe9CNDd0lM9aVQAPs+j3EL39ZsqOQsAkk5KMxsmAuWDw9Z0swgTTJJPZP
	RyzF7ckm1l0hKRUP/7TN/bWQBybAH1xjasSnYKy7cXa6TWvU7jkDMnVHBGLehkTJIGu3bC6jnwm
	vxOLFSfslziXjQOMT/3g6IPTr83I4wACH8aDcVbuTQwR0ttzLsSW47wSiqrJptgZc7EkHzqa2kk
	Yn3Hf1be54zfd6tEBZFMuHHjHfy35Dtu45sFjqtP0I0WzV11RHPD9wZf8vaFLs8UyR3T7G0Ra1q
	fI0gRcN8c6BSUI/Hqrr5KoW+ybU07scRoeRiHkUyQwhznNq32ramZ5llJZjRjs4WrJeR9vZyuKM
	Poxh6esoMEWJ0JPjQtpGIgsweX/0WIE9ivJVm0TVXSb4K2MCP5IjHLSat0EK0TquSiOQTXthzM1
	S9NXVVqeq34/XPtOKXWySqZc
X-Received: by 2002:a05:6820:1343:b0:70e:3e8e:efdf with SMTP id 006d021491bc7-714f2ae369bmr4807837eaf.89.1793597635764;
        Sun, 01 Nov 2026 21:33:55 -0800 (PST)
Received: from [192.168.18.164] ([2600:8804:5716:d800::f01a])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-714f2a818b9sm8321164eaf.1.2026.11.01.21.33.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 21:33:54 -0800 (PST)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Sun, 01 Nov 2026 23:33:46 -0600
Subject: [PATCH 1/2] dt-bindings: mfd: mediatek: mt6397: describe the RTC's
 32 kHz output
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
Message-Id: <20261101-rbrue-suez-upstreaming-mt6397-rtc-32k-v1-1-9758f38d7053@gmail.com>
References: <20261101-rbrue-suez-upstreaming-mt6397-rtc-32k-v1-0-9758f38d7053@gmail.com>
In-Reply-To: <20261101-rbrue-suez-upstreaming-mt6397-rtc-32k-v1-0-9758f38d7053@gmail.com>
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
 linux-rtc@vger.kernel.org, Ryan Brue <ryanbrue.dev@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793597629; l=1164;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=GgCulyiRe8JqnSbuYJBNp+S895kQy071XDUKSDOt2BQ=;
 b=UE2preFnWrcfBUGQB9fs2ZLD6a5Iic6l7jXV2HPJqVzl40mf4eCBFIpiaxRBYwOVNNpkVcGzQ
 NP955JBBzvAD5zz3cEjRiUa5q86u2PzDOoj38Yx6ZzP9oKolUFV8h/8
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=

The MT6397 RTC drives its 32 kHz clock out of the PMIC, where boards
use it as the sleep clock of a Wi-Fi/Bluetooth combo chip. The output
is off unless something turns it on.

Let the RTC node provide it as a clock.

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

