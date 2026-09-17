Received: from mail-wr2-f28.google.com (mail-wr2-f28.google.com [74.125.225.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 546AB4FDE40
	for <mfd@lists.linux.dev>; Thu, 17 Sep 2026 12:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789649094; cv=none; b=esXbvrirtV0vsKhc0yN2b1nS3wbBQ7gvmDWcFmxs2bmfDtj97XAoUq5gX+U1N2EXi7HuqvZ0QGh1Qd0BGDt2opiWetWJU+YS9Sa6qA0vU0zgen36TPcuhvmI9+0SwgpannTk+U6PQ4k98ZcTRWu2z5VfGo6aS8tOOCgS5cGKZ+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789649094; c=relaxed/simple;
	bh=EsnZ1DK9B73rdVZvb4yaLlND2bYXmTNqpeEfyhoeu74=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=o6RTVDx9BaRPaVCSPucV7tY+mHhBU5jNKD+cYiT109k4qhaWOKb9OIb7YORo9HObpJ3xp1CzfWQbuWbD1ZOpRVWSRxUcSv7XwRtwzb+D5bBv9Y8dKGNeCTYgJK20xcdmAYht42Xbwovl1iOgBrJAW1+7qfnFAPIDY1kNCwAnBVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net; spf=pass smtp.mailfrom=flipper.net; dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b=jM/aR/mG; arc=none smtp.client-ip=74.125.225.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b="jM/aR/mG"
Received: by mail-wr2-f28.google.com with SMTP id ffacd0b85a97d-485b1d2874aso631039f8f.1
        for <mfd@lists.linux.dev>; Thu, 17 Sep 2026 05:44:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1789649088; x=1790253888; darn=lists.linux.dev;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=pdehwlkISRfMSm0XKDXRgBO0xTq2wH3UxOwDNkTmaec=;
        b=jM/aR/mGajIFJO/ji2eKD1wrMCaHHHQb2ea7BEWnhGSBgvHTwl4QS8PDYArKi1rK23
         Qx4iMIupNPMMkvxsQsseUbuCL+wSjb+nNfXrfeeXmLOoLXIaw3603+4aPCL8SRfZVtIc
         0Dwss4hNjPO0XSCee8G4NwWRwo5VEY+he5uvhRV2ubMCuM1vqVpvhBfZJYsv9HMUPxkV
         ahLflQj4wApt86KAlkyC+JPs0jili4FmJy3SnJh5+p8qNg7Icv6NILiq9pS5CBrOnYZd
         6Ua1CLjnyVCQYQWN9mY4/tW1rqG+XTu1MMNVz+kOENVEcwftGuYbKkg8sexYBujiJhBa
         NZfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789649088; x=1790253888;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=pdehwlkISRfMSm0XKDXRgBO0xTq2wH3UxOwDNkTmaec=;
        b=HMKkui567Wc9P3Ndf0G9HJuvPTNr99BGWxMri5byW1IpmJJv2Bv5L20lvLQJt7I9gD
         dirTspeuPs3Df4/60dHDltIKD41HVJnQL9nkFkb4Op1AAKpVj/AVhD2jXuWmxQHcCu46
         Klr1KrK/zyETlZw5sKGTkkdsDkao07i3agwjZfxDfSLfE/S/kraDjjUDwnLN4QEi00jh
         G+WS1KdHmRLrxHfYHYEWuiV+u267jTHuBOND7jMPxFngqLW8FADkaiBu/r4nJDuUsu41
         Odlp4QnfJWFFhhGCReuTtk/2dj4OYcT+LZ+pjwhMeBANZG1eXr2K7uD2OEZbxRZKvmWW
         C3Mw==
X-Gm-Message-State: AFuF++ldReCXlUVWjzuLgkEzqZkROT5togMhFpchK919kCBXDCNp1g+4
	w8WSvQQAse8uCeYusQEEU2/ERfO0O3/uBTulR4OpJi48ZufMwyb9kh0BEVjHuzbGccE=
X-Gm-Gg: AYBFou2DNUnnFG/vpM1LDaRCMdKpufcXu2v0tPkcvq3wedikjAUcf6gw/DbffKQ0nb5
	I+6V141TLrFsKAlIWldrArz6BNTu4rGk5qS1FsslPgbajWgVy0KIBu9/Iyn0ZVp6SbuArpY5ZDb
	vkvBh5mMNL/bhm5sOwr/Mq0BD/KVtWOqA5FTPEVjpAvqKGdr9HMBQ2ahsaXoTvLa96rVBSYgqmZ
	+4giGy0UZyzqbuYPDPwak9zvPJHGgLujiJOBNt3ntAoFr68knbmOM8U6j1Z6ycqeQjcOLbv9n1F
	u2L1jWXDHwShxzBe7dafq2VABjXRLOM4OWkhxhXv9jzo9s4tGjfFvOThCmfh5sx+XESwejpd0by
	1rIsF6s/js90L6cnfs9q83whEeBH5iKZg1HMWImebFP0sy57bUD5y3Au+FhEKOHXKZdluQLbLBk
	qM1NcrMbBcmjDWE4BkpyLYm/KAjuJG5ap4aOL90llQEfM8K84cFaGS+fkbqDe4zvTf5mDVwo6h3
	/sQcNP0SAPtShra7QXlTDahelboLQ/lQs+bIIdJRAgGD/o3L0w=
X-Received: by 2002:a05:6000:2502:b0:487:88b:4681 with SMTP id ffacd0b85a97d-4870cf037d3mr14945921f8f.10.1789649088231;
        Thu, 17 Sep 2026 05:44:48 -0700 (PDT)
Received: from alchark-surface.localdomain (bba-2-51-220-108.alshamil.net.ae. [2.51.220.108])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bf418dcsm15274665f8f.35.2026.09.17.05.44.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 05:44:47 -0700 (PDT)
From: Alexey Charkov <alchark@flipper.net>
Date: Thu, 17 Sep 2026 16:44:39 +0400
Subject: [PATCH v2] dt-bindings: mfd: ti,bq25703a: Expand to include
 BQ25798
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-bq25798-v2-1-5086845cd3eb@flipper.net>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/2WNyw6CMBBFf4XM2hpa+gBW/odhAWWQMQZqi42G8
 O8WXLo8ybnnrhDQEwaosxU8Rgo0TwnEKQM7ttMNGfWJQeRC5xWXrHsKZaqSaWN02cpccYOQbOd
 xoPdRujY/Dq/ujnbZ57sxUlhm/zmuIt+9/2rkjLPeKhRoC1lYeRke5Bz684QLNNu2fQFunRjUs
 gAAAA==
X-Change-ID: 20260914-bq25798-67768a40517e
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chris Morgan <macromorgan@hotmail.com>
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alexey Charkov <alchark@flipper.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2190; i=alchark@flipper.net;
 h=from:subject:message-id; bh=EsnZ1DK9B73rdVZvb4yaLlND2bYXmTNqpeEfyhoeu74=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWStfrBbjF3UbNcxjrlsm05yfEp9LPl3TcqEJzsbO3bPz
 J1dNuvT9I6JLAxiXAyWYoosc78tsZ1qxDdrl4fHV5g5rEwgQ6RFGhiAgIWBLzcxr9RIx0jPVNtQ
 z9BIx1jHiIGLUwCm2kaXkeFH9fsdFxbpvgztXfrwRpC+nLayzx7RAn+5u3lf/F9tyelnZJgYGlK
 suCdAeHuK4SRdM4vdct0qsYtrOQwZ5SdfyU/N4wYA
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5

TI has unpublished the BQ25792 charger variant and pulled its docs from
their website.

BQ25798 is a pin and register compatible replacement, which also adds MPPT
tracking support (reg 0x15, added in BQ25798 and reserved in BQ25792) and
backup mode (reg 0x0f[1], reg 0x10[7:6], reg 0x16[0] and reg 0x1c[7:5] on
BQ25798 - all of them reserved on BQ25792).

Expand the existing binding to include BQ25798 with a fallback compatible
to BQ25792.

Link: https://www.ti.com/product/BQ25798
Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
Changes in v2:
- Fixed the conditional to ensure the constraints are applied to ti,bq25798 (Sashiko)
- Link to v1: https://patch.msgid.link/20260914-bq25798-v1-1-dc5e2ec343c4@flipper.net

To: Lee Jones <lee@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Chris Morgan <macromorgan@hotmail.com>
Cc: mfd@lists.linux.dev
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 Documentation/devicetree/bindings/mfd/ti,bq25703a.yaml | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/ti,bq25703a.yaml b/Documentation/devicetree/bindings/mfd/ti,bq25703a.yaml
index cdce83f05804..3bc07f25d063 100644
--- a/Documentation/devicetree/bindings/mfd/ti,bq25703a.yaml
+++ b/Documentation/devicetree/bindings/mfd/ti,bq25703a.yaml
@@ -11,9 +11,14 @@ maintainers:
 
 properties:
   compatible:
-    enum:
-      - ti,bq25703a
-      - ti,bq25792
+    oneOf:
+      - enum:
+          - ti,bq25703a
+          - ti,bq25792
+      - items:
+          - enum:
+              - ti,bq25798
+          - const: ti,bq25792
 
   reg:
     const: 0x6b
@@ -103,7 +108,8 @@ allOf:
   - if:
       properties:
         compatible:
-          const: ti,bq25792
+          contains:
+            const: ti,bq25792
     then:
       properties:
         input-current-limit-microamp:

---
base-commit: 0d9d0dbf2fddcff5859d623e90ca73c4054276e1
change-id: 20260914-bq25798-67768a40517e

Best regards,
--  
Alexey Charkov <alchark@flipper.net>

