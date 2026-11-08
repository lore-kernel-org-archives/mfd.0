Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794150854;
	b=XB2/IQ2l4X043pApOKD2Mg6Mqje7VOI9+BW4rqWWdIq1L8+OhA/wzfLngTkBtx1zYza9
	 DFVMaCDXcnk11P0jyJv0HLnNqKP3walfc6iSBoEXSyZc4UN1zeud+YQ6lWs3AWe/spAKm
	 UvEqOqBsoivvR2217XmRYqAV4lPBwLI9lcGT19zd2H/C+avwx7vCp6twRXcdcuco9eQyc
	 qqokADzSPpsndzGiyUWZ20fOf1sDYfTFCOQV0kmDoCjdX7v7aOGieEGRhcOgt9S9S/qTO
	 rSYrSlLZrvcHONxYyKA6iCDHNC48DtQed8Wdx1OilI/6UHWdriuFT3xoZhWD+Hlm9kw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794150854;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=0LbAzkumGqnEzf1rEq6hPish8MNa+ZRPJTInRkJT7xc=;
	b=F+kOiOxOAxrl7btSZMuxYbgXNWIrSWiHcW/TeY6/sB6kIeGL6BvhZ1hBPmlbDlJ156tz
	 JqaFp7lCQgrwB8VvDH2WqWkxcy5OOProMKWXiNACIztp6BeGhWebBZjwwUs2UgZmNFAgN
	 8GkGHyFOSJmR4SReDkLwkIqdMSqqnyDHn2V+zzNUpSf3JXvjT7SvTI2ILjFvDRNDWKvNi
	 wUYjp6lv2vYH0AB4ZTEGvW3smbAughKPHyDpolf9mH2mZYZAL08humaKTQB+14UdppnG0
	 PRXY7tIgYcW3jVo81pvytO0tarhIRyN+VodT7gP6tY8Mwx7T9ID+UfHNVu/vOIWGo+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YtKZCnUB;
	arc=none smtp.remote-ip=209.85.218.42
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 981D8606A331
	for <mfd@lists.linux.dev>; Sun,  8 Nov 2026 15:14:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 981D8606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YtKZCnUB
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c45551fa84eso17093766b.3
        for <mfd@lists.linux.dev>; Sun, 08 Nov 2026 07:14:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794150852; x=1794755652; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0LbAzkumGqnEzf1rEq6hPish8MNa+ZRPJTInRkJT7xc=;
        b=YtKZCnUBNY+mNkF/4XtkK7Ni5TtAlv/O3H9TuXP71gy6FbhxkJ7ODk8IJyTLwDSZ0x
         1IhqG+yn/Vn3FRJS1SpP9D/7dFIYnMLVF0TFs8nKXkSH1tVXCK08jSR5Jv1LvXMxYXQ5
         udO4h8JGUvQ6Hj8n7Rneyu/ENav+iNn7Jnp9b2q1xJCmS6twjON/q284oHFY8/LydG0t
         y9dp5lfQnUBC5bUjtaCs5kjLO0L1tMDPDzrUVlgLRZCzN9OrDkmwwZI39I2pMhCDzToE
         Ouh0Q7GiYYCuPJ4WF7lRVn6CXIENj8W8epwFm6wWAtTBtOmC3bFfUIkTFVNLLOY+r3vl
         9GzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794150852; x=1794755652;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0LbAzkumGqnEzf1rEq6hPish8MNa+ZRPJTInRkJT7xc=;
        b=bi1elg1s4aRbQDffQBVoHlEaYv/cn7nL+kfOoKeThqPDvSMy0eUzHlw55EmATyPMcf
         mMVpUn2Up8XfLoIq7LWBEQ2PiOm1JJ38KvGtr0m9IQ7uNR02Itt+rzgQ97D25RmOYiEQ
         ao/llKDDxCzlWIen2rr3bNnpcXWT1tVqiVvZ4O6lnFWKg9eb3Q0dRfCgD3oGJyBX8B6V
         oBoBh6t/RQYb2BxiMfYB5IWb2XFpWImv99ywtG2DWXII2vRJTsB48zE9cheyba17fp0q
         qpUtmiWzGUCVK5nPfKvqhtI/QyrCfrEjdHzt+SGSDJYhObJYpLcxQp1kaz87Cp/QKvMr
         QM6A==
X-Forwarded-Encrypted: i=1; AL+hErE3TbMefhEYRl6bHpRq2++HApRV1iuFZRiVzpLHc4QF2Vy8DalybWgt+LPDZFq9wuIGfb4=@lists.linux.dev
X-Gm-Message-State: APuU4Z+ecvUb48Rx6OZ2WakwFEga9TJTzNMJIRPrxrWExyuTCyN6oXMU
	N5C6Khb+9EiSNgLydir9W+P97wbYmZ9M2IYZoY3X8kMYXoyOuWTI5qKD
X-Gm-Gg: AYBFou0R4anoYJvTWbWmKw2fuX0bprvzOd//W0V5XHNN/Jvxj85pAbBv85Xlclx4Z9v
	MGVkcGSdGqHBAsU4lmC0hQrtxPHBVxsUscSEksDjVivmc/9YT64Si84g1wHe/xt0KniBUO7Zsic
	O9vefag8SA6qYv8xtxFsZ/aiosr1k3QVa/TosXvv486Nn2F385aF74etwvAYkHNnaSXDXi67zGJ
	z+DYRugX4aHXNhoKmigEjdzXiWaJmzm8Tj5sofVvsDvr4XbYVTMqRPADz8Ve/KWXyI66qiBgLK+
	Y11S0g38tvUI/Z5TOFDZ4jHHhknP+z+IcDWWpCAKrsmvj724GIQECeBsinWoaD0gAL1w2zs60r3
	qQgQOJvAg7Y3x/VtnCxlPpAAQzqhMoXkjPn1GuDAqYH2SEfLhxt6o0Vsng2BliBlKcAlGokLaRD
	jq/5qa05p9m9YkMe0yobU//oo67YL2fiMD+ldtg1waH4tWH3AsMjiCkYmzL6003l3pDLSa4vdI5
	kj8WsLipHflydT/Pl5F9xysSROkuc4zUfyw6y0hhU4MTJK3FU9fksPm6CBT7sKEMPEoNWHCpTZA
	dXzwMyXnG+YBXqJ/L3BUaS9ZUfqPrtfJnOLn8Sd/bhFaYLRk7o/X5P/bTPqHQeGczS9I/1ENBJq
	VKZ7LRfqsKA==
X-Received: by 2002:a17:907:9624:b0:c26:1648:a062 with SMTP id a640c23a62f3a-c4d6d79cd56mr106518466b.29.1794150851962;
        Sun, 08 Nov 2026 07:14:11 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d6a978892sm69689966b.58.2026.11.08.07.14.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 07:14:11 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Griffin Kroah-Hartman <griffin@kroah.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-leds@vger.kernel.org,
	mfd@lists.linux.dev
Subject: [PATCH v5 1/3] regulator: dt-bindings: maxim,max8907: Document LED support
Date: Sun,  8 Nov 2026 17:13:46 +0200
Message-ID: <20261108151348.204182-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261108151348.204182-1-clamor95@gmail.com>
References: <20261108151348.204182-1-clamor95@gmail.com>
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

The Maxim MAX8907 PMIC supports a single LED; document it.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../devicetree/bindings/regulator/maxim,max8907.yaml          | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/regulator/maxim,max8907.yaml b/Documentation/devicetree/bindings/regulator/maxim,max8907.yaml
index 6cf8e93867e1a..ee1a305d1c210 100644
--- a/Documentation/devicetree/bindings/regulator/maxim,max8907.yaml
+++ b/Documentation/devicetree/bindings/regulator/maxim,max8907.yaml
@@ -31,6 +31,10 @@ properties:
     description:
       The input supply for MBATT, BBAT, SDBY, VRTC.
 
+  led:
+    $ref: /schemas/leds/common.yaml#
+    unevaluatedProperties: false
+
   regulators:
     type: object
     additionalProperties: false
-- 
2.53.0

