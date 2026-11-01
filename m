Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793523484;
	b=pRzxIzs4QOtYzKU5AVWrV20EzAp/WU7AAGBb0NJjkg519apAdfZK+Dc8kKvSZ8io0Tu1
	 G8XZZv7B3jW53pkIFqw81SeRUPcn8I61iGtMG3DrXTnsP8e6JO6+73ET27xmo1dZROoA6
	 vu6fZx0wsX0VCTDGt6fEKo+44g1UMaGpk/NA8iHE6iA7GSTagMnK5KocfNGz2GwMFVJC+
	 L5qYKuu24dnXLOrDdFOF8/3YhjjTz/KkNa76gQNnrY9BbEuMeXpeIVNwqpgq2itcKzZu8
	 EXuMnmfszUBD3iC0UV3jam1Gk5tiryj5QAyPT1WD2KRuFkehtcHE4FEWY8Y2QouFJaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793523484;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=yeNJ++BKL42aV+GwG+jG/kvKRnbuE3DMU/E3mLJtGyU=;
	b=COlRHAnhXgvPb9by8VTyl3lONl1oJ2g4jSR3yWYgdQzuVOAj7tWZXC91CyIh1jTv3IGy
	 VitPIYR+iNH3KOf+ER2rxstrmvm+lJmzLiAjaURvlYZhq6vdMf7tC0e4ZW04w5JxOQnGQ
	 siKqaZOwggHRjl53nVOp5JSWAiM5LVIt2GtJof4gNbJmcKBQB7sw9nbFHdJWGi4c/AQuO
	 4jXBJrj4bUENmOltV0v7GiGHtVJOiecF7xQ/gyh2kEEKEQ+UkcO+Bj1HVLa/lo1Z7XjJq
	 5BaRWy3u6yFKGOxEshSjT2ztyii6jIb1v3HMokZeiU0bUy0jtvAFvkghRvGadz1AdAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TJfX5qbA;
	arc=none smtp.remote-ip=209.85.216.52
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60601606A324
	for <mfd@lists.linux.dev>; Sun,  1 Nov 2026 08:58:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60601606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TJfX5qbA
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3adf5f6833cso1121914a91.0
        for <mfd@lists.linux.dev>; Sun, 01 Nov 2026 01:58:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793523484; x=1794128284; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yeNJ++BKL42aV+GwG+jG/kvKRnbuE3DMU/E3mLJtGyU=;
        b=TJfX5qbABVN+66nfrx47PZIIsBQw7dG/q1SMpowm19HHseAz/YvBpLc05E0t/sES2N
         19u+rvVGZL7uzMmh0lco6DYGEd48WcYc1bNG199HLHttGG1ZkcVQRAMM6t3gn1vH4zww
         RE2Ijmzxe3Irg27rt/HllJ1pZpANte9pm3k63MP3m22NU5JmnXL/PpGFguNqD1RN92re
         NMciq1ycBZ21dylsVqAO+qaXLCw6qctSj7Earspv4BNDrHYdKeQQzYiU85+RBa360En8
         JuQp2NXdkJT+rcwGWMznMUGo6wGz6FOSwuqbGGvqUDb/qW7ecC4XFJVxbCKAuKboTxuU
         i9sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793523484; x=1794128284;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yeNJ++BKL42aV+GwG+jG/kvKRnbuE3DMU/E3mLJtGyU=;
        b=LNd/3nfb5NTosUuCRTeB6/CTtRWZ81k6wt3bfBqBlZPCwAMgLyq+53CLfoIvbXbE12
         T+aHkkfpGRe1NN/xi0WLJWgDSLuZc1+729sJMG6lTo7AC7h2TJ2s9LhMYJ5zi+P4RFTl
         NPK0n/rZdcYgOfbicdM5yluDvdPlEekYXBM/qaRgl//6OlNcUrc4Hwfe5JwwVFDAH8Qq
         ZT6MNy7qrq4aZ94hhRu6SxnWV1Q7z0mU9X69Rn1Vv4pNzeSgUO0mpNmEZKD/9+2T0Fdj
         7qH94E0wRuSKD5NI19C46zaUukKiuf4iEL3ZwGFit8sFD/FA/OFWISx9jOTWPxqYLdpV
         BpXQ==
X-Forwarded-Encrypted: i=1; AKwUvBweSHDtOioFXccMfYdUb8WeOjg61QbF6oCl5JXY3JVWzB/wdPp7g0aH4gNhY6U1HFB552Q=@lists.linux.dev
X-Gm-Message-State: APuU4Z8nqkHs/Ksxacpbma76YpuD4dqP2GkySyLK+7hUV5twlQk2MruG
	zcONaZ8k8rMaisMYSVxAUqVb+2BakMifTgpQAhHiEoxoYXzQUJHmZdaP
X-Gm-Gg: AYBFou3s5OaTuoYpWzrmEX87ULSxxUBoOopWIOU8/MHqaNQFgWYXoofbmi2Y6OxIe2g
	RhUmVLau4q6mI6P1LcMU1CtoqZUiCyZXU2mCmrY992P0Va9UtgC1uGrtNnjYzkILqsBZVih4OIN
	fW+I1EWkQEMscOuZXpL0nKDroGp1xgEP+6njDekth5x5nhxiA5yo7aQGGKnI2wyRyzP9UIKp4Dt
	LNQzYiJrDXGWLTuJfGPNdsBReGqJY8AUhKR/NuGtYe6duW/mh0nzBsJifEovZe248EdJQhqgd3b
	+ui5I7fcPp4JCx5w9cDhLJT12krEoaMHW6tDKshiY/AaFg7KMAJLclPICfyjGiI5m3xk1l/Qwbq
	CaSf9W0X6aQTn+VqsSnkQzH2Y/vO03Vrc1AJ8a0jSwbuhdsYSkoYXjDMpoI2KICHoJOkaEFrLo5
	YlLUGf5zlCCNHOtMLT0ipfgnCAHjWDZY1kmyZFoWTWVemBcp3wbFerx2Xs3JaLKYy++UXMmvUmq
	ahkTXX1ikDBsD9OdarEVnQf3dmddcfbmLgPnqEHSIfcbkEHubis+RgadIEyDpQji1tS4HKTB2En
	Tjyihd5gKRxSKCkw2eGsEv74G6BYaXZVTyY94lpPDOJGQFzDJ5gpqKnv21RUUelg
X-Received: by 2002:a17:90b:3e89:b0:3a7:9045:fe29 with SMTP id 98e67ed59e1d1-3ae895362e9mr5921922a91.4.1793523483673;
        Sun, 01 Nov 2026 01:58:03 -0700 (PDT)
Received: from arch.localdomain (123202092027.ctinets.com. [123.202.92.27])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e2a703esm14385693a91.0.2026.11.01.01.57.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 01:58:02 -0700 (PDT)
From: Jun Yan <jerrysteve1101@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chris Morgan <macromorgan@hotmail.com>
Cc: Jun Yan <jerrysteve1101@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	mfd@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: mfd: bq25703a: fix input current limit default
Date: Sun,  1 Nov 2026 16:57:52 +0800
Message-ID: <20261101085754.277830-1-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.56.0
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

Section 8.6.6.1 "Input Current Registers" of the BQ25703A datasheet
states that "The default current limit is 3.3 A", while the binding
documents 3.25 A.

Use the documented value.  It also matches BQ25703_IINDPM_DEFAULT_UA,
which the driver falls back to when input-current-limit-microamp is
absent, so the binding and the driver now agree.

Fixes: 76bc2203a46e ("dt-bindings: mfd: ti,bq25703a: Add TI BQ25703A Charger")
Link: https://www.ti.com/lit/ds/symlink/bq25703a.pdf
Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
---
 Documentation/devicetree/bindings/mfd/ti,bq25703a.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mfd/ti,bq25703a.yaml b/Documentation/devicetree/bindings/mfd/ti,bq25703a.yaml
index 3bc07f25d063..607873e270b4 100644
--- a/Documentation/devicetree/bindings/mfd/ti,bq25703a.yaml
+++ b/Documentation/devicetree/bindings/mfd/ti,bq25703a.yaml
@@ -88,7 +88,7 @@ allOf:
         input-current-limit-microamp:
           minimum: 50000
           maximum: 6400000
-          default: 3250000
+          default: 3300000
         regulators:
           properties:
             vbus:
-- 
2.56.0

