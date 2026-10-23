Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792749847;
	b=akXeY7VN+8cq581etzQ2lLPuKLl3/62cui7p51/ES5g9NpX90XZMlhPBk9QvJEBzFy8N
	 szVl6TWEE9YvnbqJMVb+3CF38c5iQGXdzUFYpRuFBHM43TNCnXR8uhu9GIHtuL6UCkZov
	 F4ex/nPnQOjVxkubbT+Mk98sh70r8eZBE1wtoawPb/ZFukYi6bDBsu4YoZQC8EnDhW28M
	 rx+nj9dCBGOu+w0+x8NbxL/abzVnQIBMVSGOZ8K2I+mKDe4GWWLzpoStjJDzKeosvAeAD
	 3TtsdPdCkSjB2t8KlYyCh6fc++C/w9cCQmvjkl6jswC6xGXNoTr/TYfXAHDRWdd96LA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792749847;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=1gV3tNHqy00KFgHBb5wg/giz1xNp3VUL7qP5ig2FUmU=;
	b=pAr+cwNebBG/1sON9y7QpRfSZ84xwGBTMYtCHPQZJRcaMB56HSxNuR5bNyEKwg7LSFGN
	 jYOxMexKZBZigCCRfzR1bJjNhReCsHFNM2SktSd0EzVKYaskgbESnvrm7ANRXSO72IdWk
	 8q+/O9ZLnVqufoNVpMkbS97lv5vGSiNZTv+eVnAFwTB4BjzssMkqaAOruZXEsbbvL4JiP
	 QlAK5ttPYkKjp2AdwXM21uZcImDUYztyRwUUMDvqqH/9oEPT1oU/Pf9j+YrMun6DXRqOR
	 PGMFbEyjrbb4/OrqPGIisZvBfhhNA45kKjDQ8XvH+DJqi3DLoLspMHBjCKcK+xpD50w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=mgcrea.io;
	spf=pass smtp.mailfrom=mg-crea.com;
	dkim=pass header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=IV3+B1P4;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF51F606A31B
	for <mfd@lists.linux.dev>; Fri, 23 Oct 2026 10:04:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EF51F606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=mgcrea.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mg-crea.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=IV3+B1P4
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a1df4c0966so3720525e9.1
        for <mfd@lists.linux.dev>; Fri, 23 Oct 2026 03:04:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mg-crea-com.20251104.gappssmtp.com; s=20251104; t=1792749844; x=1793354644; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1gV3tNHqy00KFgHBb5wg/giz1xNp3VUL7qP5ig2FUmU=;
        b=IV3+B1P4cx21lQltOOISV/LVHxGR2xB1QDi/rZ3A7cZ40Is9XhcrF0Ps+NiUSe+T9j
         Xo6bxMXuJu6sLqZtU65cHeZlZw9nw+arHeMp0ChSL8wSnZNYoPB/ZgTckiXu1f0EKr7o
         QatplNnXwxcvtb2HuBbTA0d2oFdpzZG9r9pTnaIe/l5SWKRPpzOBMPQopkH/mQq5X+4E
         spJ8IqOq9chiRB14YuNph+s6LWbofuu2fGqxRtgEd/3i11STpV1b2j2JGpsqkdok1pze
         3K1tuJ5zTOl2uOF2odVjtUBvWsllUVFnDBy6myNTW1AeQPquiHLJ2CgFQYlyPfnuZWpd
         dyqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792749844; x=1793354644;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1gV3tNHqy00KFgHBb5wg/giz1xNp3VUL7qP5ig2FUmU=;
        b=ZojIFNNcWx2M/TWeYRvuJ4+Hm1K0UOS//19OmopeRz5T6JW+1MoOBpFi0tLMyPeELf
         V+S/vuHbfqd10iLU0OGxMXy2ADFoSyvaTxf9d4kSVS3xtmlYXmPP8bA9q5JrOlfHdPsp
         /udEpXu/wmsd23yPerAbANiSS4rWXTNDI+Yo0wGO35z28UpE7Q/jc+ayasFnmZgPS9Sm
         MPlgpFoR9rMxZyc04bqub54ynQYzDIPxKUaRCcoEEMA3mu0a4F0cpBGo+ZHtTTAyufMa
         AgtUEYIEhynByAq0dE2i3eooPkkuFOCUiXomuvIqku6FBY4hwE8glbFzanBTSQ5t6t1i
         Us+Q==
X-Forwarded-Encrypted: i=1; AKwUvByS9WXKeDSw4Nj2JIbZi7PS3H1irv1zW2c10kRap2b8Ua7ZEN7dQO107emt/ruVingAA+I=@lists.linux.dev
X-Gm-Message-State: AFq9FYJ48GvKpHHl1qPYfn3+lcxjvZAx8r3rKXBgxSLbi61oFbC1MXcl
	K6TkDmAqiPHyaU+2zOkn97bhAkD0xaSstFK4mM8ymoJ05S1R8Ojd7UdvMhYxieRU+B4=
X-Gm-Gg: AYBFou16XgM+b6WpLPNglY1Dsw+GSyUHOZ2D6ESd6LrGc5iCUQSOvtL4cw/0usiWBCz
	NuMT1Y5iKvGwLmqiq9eKbuUR3dF1A1I8S9CW9gQCzi1WiyWnI/4YFUACuwOQm1+vgkTVI5DJkRN
	EGAmgoeeliIZWkm/RGJ66ULyu3uy1PRF4VG0cquAJpMlkT/wxRf7tj+UtBuBNXbeJkvfXLnnAht
	eSe3ZFC8tbKCsz566JtlL8DazF8u0FknqfI2ZxsTJb0fQQ9IzwfpksHUsEf9L0/qX/sjfxkQ6t+
	IUl66giUkRNDRXLS1K94KLJ22oOKnK/2IkpJj0fcKSMCGTWTlhvYkrhgQe72IcpMQON0fis7xXu
	Pbo6CQOJK5JIl+tsWJko6dwSd8o3yGE9hG0ojv+dyHxHTwpy/A7mk206wI92HYSq4WO8ll6zJLV
	+A8/FcOeBns/MKy8jjmQXgtG0p2mhOxj0It7rMS2dPFMyQgvzaKRsR8sntzmR8bQOSVJg0wSsS4
	r70SfNNiGflnjc2uXuT7Mxcra/LGTEebueXjgHszP+IYZ170KcDXM0rMPL1R6kZY669CuwMZC5R
	wl/x7aI6zE9E
X-Received: by 2002:a05:600d:8051:b0:4a2:18c4:61a5 with SMTP id 5b1f17b1804b1-4a218c46284mr6468035e9.6.1792749844041;
        Fri, 23 Oct 2026 03:04:04 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:9c3:9990:6877:44a0:5297:9502])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a21045df9dsm75761435e9.8.2026.10.23.03.04.03
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 23 Oct 2026 03:04:03 -0700 (PDT)
From: Olivier Louvignes <olivier@mgcrea.io>
To: Lee Jones <lee@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>
Cc: Olivier Louvignes <olivier@mgcrea.io>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	mfd@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/7] dt-bindings: mfd: x-powers,axp152: Add the AXP2101
Date: Fri, 23 Oct 2026 12:03:55 +0200
Message-ID: <20261023100401.67592-2-olivier@mgcrea.io>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261023100401.67592-1-olivier@mgcrea.io>
References: <20261023100401.67592-1-olivier@mgcrea.io>
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

The AXP2101's interrupt line is optional, as for the AXP313A and the
AXP15060: the driver then registers only the regulators. It has no DCDC
frequency setting.

Signed-off-by: Olivier Louvignes <olivier@mgcrea.io>
---
 Documentation/devicetree/bindings/mfd/x-powers,axp152.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/x-powers,axp152.yaml b/Documentation/devicetree/bindings/mfd/x-powers,axp152.yaml
index 45f015d63df1..f5e2c8232581 100644
--- a/Documentation/devicetree/bindings/mfd/x-powers,axp152.yaml
+++ b/Documentation/devicetree/bindings/mfd/x-powers,axp152.yaml
@@ -68,6 +68,7 @@ allOf:
           compatible:
             contains:
               enum:
+                - x-powers,axp2101
                 - x-powers,axp15060
                 - x-powers,axp305
                 - x-powers,axp313a
@@ -84,6 +85,7 @@ allOf:
             enum:
               - x-powers,axp313a
               - x-powers,axp323
+              - x-powers,axp2101
               - x-powers,axp15060
               - x-powers,axp717
 
@@ -108,6 +110,7 @@ properties:
           - x-powers,axp806
           - x-powers,axp809
           - x-powers,axp813
+          - x-powers,axp2101
           - x-powers,axp15060
       - items:
           - const: x-powers,axp228
-- 
2.39.5

