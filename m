Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793907908;
	b=R2EP4oaRxORM3q/CauhBFYtkF8eu59YFOcjJ06G+/YlbLA/frEhyVXb44uoCGvoRD4e0
	 tPPS7IjOv3kbHRGigyZ26GPkJJ9XDPJi/IILsvXGBBFldOj+0JXhTVwKINjj3ZUcYrH6E
	 ax0QpZaa1tvH6X9AaCiE/10IE+7H7ua/HvyAJUHrreCCW/pWUeAStm6hTUvIaWoH4Ni5/
	 p3NNQ0wURl2+mgmp3qyf7Kxcg+YwycZlg6bd6D22I4Nd/lrlfE44n89PVdjEz8qp3RwnW
	 gFL7bkyCRq4dNuNZqGj6QI+mHp8xYy6WTHuzVY3zUxnQ2+e27ibc34ZQ7GzOCbEcBwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793907908;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=fdpjdk832N9BwoCOr6cdI+ScZVBChe7jU8b/pMSH0Po=;
	b=2B9nr7tcMbIYkShN3VToBi0Av0ezhP+Z/nBOmk8xaRusRDWeLznLXRKbEg+k0/7rh94z
	 VjiMox78f6zrLGq2cY3K3nyXbh0qSXRDm3iwLuUMqeDVnbLBi7yDxDLp/Z9umJpcKhrei
	 +SEFdwO4vIaG+7wQWTMrs76kk8mrDhgawZH+KVQMEyyUhf6/JFQG4gxbCFt0nkL/9Uqli
	 Byc6T5DJrxNFkbaevXbfUIlyEoxEh15MwawI35fYXLZTFojJGQlkLZ+pjOLbVdKM06NJX
	 r6LjKZJp+L9k9arBwaSjhj5qx8BfWb0uIwdQtqhKXasibLy/mdTvhPpXhf/H1OtavgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dcXcAlFH;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EB0D606EEB1
	for <mfd@lists.linux.dev>; Thu,  5 Nov 2026 19:45:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0EB0D606EEB1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dcXcAlFH
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a5b2be99a8so18963215e9.2
        for <mfd@lists.linux.dev>; Thu, 05 Nov 2026 11:45:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793907906; x=1794512706; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fdpjdk832N9BwoCOr6cdI+ScZVBChe7jU8b/pMSH0Po=;
        b=dcXcAlFHtbUeYMMzNAC0aepm6PZqPzjfSKNWH9AP55fgkSGe6iqiK8uOReawNfQtYt
         7npRDICkWDdtyD86Ec/VwKHQYQ70fCla5uqfXOs16EAkLhoJQqOJ7sPxfBff/IuSeutN
         lzGPi8ZOFYLWkokrk57Eyy2QO6ix2Jzt+XezWvXVpv0ryI/HUL8g/hGSKm2yhjFUmF65
         zcBP013aXHN1UIm5roRHBgchw+V+YW8hxcCicUU7gYroMBaNkkASyWHswKMCh2l4V80l
         zxhDagpBbLy1cjqM90j5SaYXb0N60WYV9+lBhqhfmVEZCJmU7bacr/reSnk3UK23gvH2
         +eOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793907906; x=1794512706;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fdpjdk832N9BwoCOr6cdI+ScZVBChe7jU8b/pMSH0Po=;
        b=d0SxAULZWKxRmMuAF1rSzzpH/OUcEyX2HbmvbDJ0GShPHep0PAmXq18iO/FLVVsck/
         mc9DzZrgdsi/LY1MK8djYCLxBG2TAtYZmpaACq9ft7vAa8ZflibE82/YMjeTFJFtz6Jq
         1v2R78PCNIdC3xor7DMCdjmZMhzhU4A4+Xj2PxPm7GV4DAxk7ibAVW1urzSz1h12XS9h
         zfOHiggqCFswDzrC7+tn7nhD8K3ZVOg0x0jeot0wxjhqSXVdYAFUZaYlQEquZIJ7v3zx
         321uU8kbxldArznf0mKFET2PtukA+Xkp8F9nszmdHc75hRxMczk59/9zrTSh7waMIIJn
         EEwg==
X-Forwarded-Encrypted: i=1; AKwUvBxJMmZWLtBh+wBIQZxcwvSxyT4xs/fPyEuHMpKNhpVJ4crOyJ/+GnvJATTs6W8wqas5NGI=@lists.linux.dev
X-Gm-Message-State: APuU4Z/F7ewRXNreCHb4dafihlndhmrIOr2OtmUXcSwpYPEET317FM+A
	gu9UFRIHhdLfeGe6UIYU41rI+E1d28CXHMPLJlwcQeN5ywDkXB/JXPQq
X-Gm-Gg: AYBFou3fWLaPwD35qSSDGUrTq+8YvJvrk3rPfE59FTYwnpSnlLTa9RH7AqG40GRfEmm
	LOrL8Tip/z71l4oGiR+Zmaww5paIIHYfvsuGlfBaWmPsQh8GSC9Sp6tQgMoZo9zUKEuMtYXOflb
	Lawk5ncF80lBUh8FHEBZkalwGCf3gbqD7dmiwjGcPrsryXuBQu/12uH5KhOsxyfhjMvA0H56ak6
	BLZfbSLbWOsT6XM24ZGTwv9+b0KYlDPt5YTHOE8HZbQe60SPe9NjsIkFWFFyBjt+atCFXupoc+p
	Mjw+/N8D7ryxGwQ+uwChB0TLpBHM6dEAOHdewmJGXIJrSErW9HwFc5zh+6k7IzuTfc8eQwlbs2Z
	KAX9f0K8m+CvezRiNz7vJqoakJYKHBcLmRMCQPQ9PyPYFu2N2uh/mDQCqP7tY77MKLmBEXYVIi1
	gaY46OTWXYvXi3C6t5gqpd9swPAHHK7SOkx0ECY/F2YQ2GdBavgT7s9soFfmMDfXXN2lf+Dt1HZ
	SGg9JTKQQKPTSaseVEx+BpL0T2LId5lM1Zkt3tUcg8Bh8tmy7u1z4mM1QFMhDXuCK7ObHhPxdwA
	ucEmvcLg2ADp07Pxgq0jHvFI
X-Received: by 2002:a05:600c:34d5:b0:4a1:dbdf:17a8 with SMTP id 5b1f17b1804b1-4b6db1c5e0emr3268735e9.2.1793907906381;
        Thu, 05 Nov 2026 11:45:06 -0800 (PST)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b6df5eaabbsm4204265e9.2.2026.11.05.11.45.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 11:45:05 -0800 (PST)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sen Chu <sen.chu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>,
	Lee Jones <lee@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Val Packett <val@packett.cool>,
	Fabien Parent <parent.f@gmail.com>,
	Akari Tsuyukusa <akkun11.open@gmail.com>,
	Chen Zhong <chen.zhong@mediatek.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	mfd@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH v12 1/8] dt-bindings: mfd: mt6397: Add MT6392 PMIC
Date: Thu,  5 Nov 2026 20:41:32 +0100
Message-ID: <20261105194426.1113050-2-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261105194426.1113050-1-l.scorcia@gmail.com>
References: <20261105194426.1113050-1-l.scorcia@gmail.com>
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

Describe the MT6392 PMIC and its RTC and regulator devices. This device
is mostly based on MT6323 with some similarities to MT6397 and is usually
found on boards using the MT8516/MT8167 SoC.

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml b/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
index 055625362951..8ecc44a88a14 100644
--- a/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
+++ b/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
@@ -39,6 +39,7 @@ properties:
           - mediatek,mt6328
           - mediatek,mt6358
           - mediatek,mt6359
+          - mediatek,mt6392
           - mediatek,mt6397
       - items:
           - enum:
@@ -75,6 +76,10 @@ properties:
               - mediatek,mt6331-rtc
               - mediatek,mt6358-rtc
               - mediatek,mt6397-rtc
+          - items:
+              - enum:
+                  - mediatek,mt6392-rtc
+              - const: mediatek,mt6323-rtc
           - items:
               - enum:
                   - mediatek,mt6359-rtc
@@ -111,6 +116,7 @@ properties:
               - mediatek,mt6331-regulator
               - mediatek,mt6358-regulator
               - mediatek,mt6359-regulator
+              - mediatek,mt6392-regulator
               - mediatek,mt6397-regulator
           - items:
               - enum:
-- 
2.43.0

