Received: from mail-pz2-f42.google.com (mail-pz2-f42.google.com [74.125.228.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C783652CCFD
	for <mfd@lists.linux.dev>; Tue, 29 Sep 2026 14:07:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790690831; cv=none; b=FOaeU8RlbvDqYjz+PPohHik5/pZH0rFR7xxf2g+Pw1gcdk1W6qrdp5cQYExRqH/LVe8ITNljN7Pae/ahFsnuKYQibQfRX+5G4hEoQyOoKFbkm8u/5LxckqbiBFDPEzF8TZT0bO4Xr/7tDzU/L7FRsJOoOZibV0xIkum0CnOECoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790690831; c=relaxed/simple;
	bh=Vmig5rZ+c16r3hkNpOzGu9/REi7dEcyRJZF5KlSxI9A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qrcUXvCbK1/EaCZmvRgVJjFIEQwHmvyQ54G5Gp4gbN3DSzZQ9lW8Tx75kAuzuX0KU//YKafaw71RYT5a16phGM2ZGKN+vrMmevmdos1NPmsTRZ44kWzJQ/ldvMz1RzL80imty9ZM9563htT6Kqh9+wM+y56yya+KO5+ZHvVWYkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OzNBRI1/; arc=none smtp.client-ip=74.125.228.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OzNBRI1/"
Received: by mail-pz2-f42.google.com with SMTP id d2e1a72fcca58-86dd69a1b15so866427b3a.0
        for <mfd@lists.linux.dev>; Tue, 29 Sep 2026 07:07:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790690828; x=1791295628; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FDqj1iQwJZUY/2vPDH4xvwzMNQEpOpP9aM8RQ3PhJ9k=;
        b=OzNBRI1/dfuqHLnUFC5UB3JT/PZwqz0bARpw0an4vqBzI1MHPi7eqUFElUY7qZbi2/
         7ckSg/1DerajTE/POJAqedyqvhwuyPOEasXbwNawG2q8sGQ6YGYlOosHjcy308BbWXSw
         pMdHxN9PPKPpXZVdky7e70AQMcHuwo3A556oD391TUFix0jQK1MN5BLjvHBmUTlvEcAo
         mbCt8K2Zcm1MK+kZHirrxBzfLjbqLJ9gnKi0FwkjeAwV7JQXGIUauGEdls95E+Srh3Dk
         dkHEC4rcLNrH5u7cR4LpWhD9q9XMBPksnsTnjlmcedUco072ny8S82tn7FGYwq3dTbd0
         JDvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790690828; x=1791295628;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FDqj1iQwJZUY/2vPDH4xvwzMNQEpOpP9aM8RQ3PhJ9k=;
        b=OztLtcb1UTtwTIWs8+qK8c19oG70ZrHcciakTwYc06lqBL+6uSKW4EHf5qVBh7dDzR
         TQT5sXe4H6q7ur6Xv0ckoHYDVnmYU/FNowj3n+tdlfNJ3/Sau9y2dn+7vvdmA4iMsqb5
         +8I/4OkMszE5xpI0gj2ABszR7lNQqieWd7LNR0eLuSD5izSSOlHlxiHxur/207gm0aIy
         duPg/EBQ2bY1o47Vbt2XSDPro4DuefpnkvDjBHBVJ5hMNskdNugHBbh1zHRpWgQS5jpY
         n0Gy1OgrYpL6SgyRpxq+jiid1Iw0zqK8Gy068UlhpCLoZ4PUUiwJLrf7ARzDe+rPpMBY
         hBPw==
X-Forwarded-Encrypted: i=1; AKwUvBxewesfenOF9Z1bghTnCR4sRC9FI1XcuXCH8PKXbCb24PG9uLRfAt9F3RhDuijB4J+ishg=@lists.linux.dev
X-Gm-Message-State: AFuF++klv2SFQ4828xM1XgV4+Zrw8aSqQ2n7ccyhmAkTeKkT8trmy04s
	uHlH6+D9zTjHTRCAEJ/q5L7MZYRQqCATVH4oZRKv+FMF+RSX6eUZIat0
X-Gm-Gg: AYBFou0UTZZ2cQCcRvsYx5ZL1mdExa/vcNEtBvpzx0AudSE6MTYCih/Vg2trTOneTYw
	5c1g/H+dtlO9E/QSwlR1cyDaz+Chq2aknSUc8RtrK73Drs5ADMMbVr6Ag5Xji/XBZC2C75C7duU
	ASfNQb5GrkSuf1QAaX5dSEYBPgFgNiXZ/6RTP0Opje/MIjUDUQnBEzOzNhtOOHIECckl/E3YV2l
	JcUhCL5z8pvzmLilMkbFkfy8vcDMSrq5oTWnRUgMUCrKFkBvnOLKce7nhH0Cw3604KRHz+prDrU
	xsmjA9N55nvpcZUJcNm6rzmubxwlcT0tUEbo4xGj8Hc1BhHLqcxbjO8iKCnl+9iw8bbvdfcewiA
	eLPlEIf60h7qdaqTze5BL4h4T8K793qkYID0KR8/S0+TvkpbilK6qRT02Qj4qN+Nr2oRTcOORnq
	HAyW4UoZujxe3ZmbgF8FLHDxjfy8UpSPzSWcPBxy3UgsKfvAgWJ6HYRHXHBhBGECWKdLzKjwNfg
	IQuBBBhtag=
X-Received: by 2002:a05:6a21:4d02:b0:3de:5897:ef9d with SMTP id adf61e73a8af0-3de7c889886mr2099166637.0.1790690828140;
        Tue, 29 Sep 2026 07:07:08 -0700 (PDT)
Received: from Aaron-M6 ([188.253.120.162])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc7b0f4ab05sm3526989a12.29.2026.09.29.07.07.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 07:07:07 -0700 (PDT)
From: Yaozhong Li <yaozhonguwl@gmail.com>
To: Lee Jones <lee@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Chris Zhong <zyw@rock-chips.com>,
	Zhang Qing <zhangqing@rock-chips.com>,
	mfd@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yaozhong Li <yaozhonguwl@gmail.com>
Subject: [RFC PATCH v3 1/3] dt-bindings: mfd: rk808: add board level power hold GPIOs
Date: Tue, 29 Sep 2026 22:06:46 +0800
Message-ID: <20260929140649.55-2-yaozhonguwl@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20260929140649.55-1-yaozhonguwl@gmail.com>
References: <20260929140649.55-1-yaozhonguwl@gmail.com>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some boards route "power hold" lines from the SoC into the board's power
circuitry. Those lines have to be held asserted while the system is
running and released before the PMIC shutdown request is written,
otherwise the rails can drop and come back up instead of staying off.

Add power-hold-gpios to describe those lines and power-hold-delay-ms for
the settle time.

The array is bounded at two entries. Firefly's vendor kernel handles
exactly two such lines, pmic,hold-gpio and pmic,stby-gpio, and its board
files use one or both of them.

The lines are released from the PMIC's power-off path, so they are only
meaningful when the PMIC is the system power controller. Require that,
accepting both the current and the deprecated spelling of the property.

Assisted-by: LLM
Signed-off-by: Yaozhong Li <yaozhonguwl@gmail.com>
---
 .../bindings/mfd/rockchip,rk808.yaml          | 27 +++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/rockchip,rk808.yaml b/Documentation/devicetree/bindings/mfd/rockchip,rk808.yaml
index 50dfffa..9120222 100644
--- a/Documentation/devicetree/bindings/mfd/rockchip,rk808.yaml
+++ b/Documentation/devicetree/bindings/mfd/rockchip,rk808.yaml
@@ -43,6 +43,24 @@ properties:
 
   system-power-controller: true
 
+  power-hold-gpios:
+    minItems: 1
+    maxItems: 2
+    description:
+      Board level power hold lines driven by the SoC. They have to be held
+      asserted while the system is running and released before the PMIC
+      shutdown request is written, otherwise the rails can drop and come
+      back up instead of staying off. Only meaningful when this PMIC is the
+      system power controller, through either system-power-controller or
+      the deprecated rockchip,system-power-controller, as the lines are
+      released as part of its power-off path.
+
+  power-hold-delay-ms:
+    default: 0
+    description:
+      Time to wait after releasing power-hold-gpios before the shutdown
+      request is written, to let the lines settle.
+
   wakeup-source:
     type: boolean
     description:
@@ -113,6 +131,15 @@ properties:
         unevaluatedProperties: false
     unevaluatedProperties: false
 
+dependencies:
+  power-hold-delay-ms: [ power-hold-gpios ]
+
+dependentSchemas:
+  power-hold-gpios:
+    anyOf:
+      - required: [ system-power-controller ]
+      - required: [ 'rockchip,system-power-controller' ]
+
 required:
   - compatible
   - reg
-- 
2.55.0.windows.3

