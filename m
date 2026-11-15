Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794733535;
	b=ypKA3asJE0MDShAMjieHnwR+t+Imfhgw3WOXYttTTI/cEAqMgwHlDIjKq4SsQv6FM6rD
	 pho0O/bmEuh9CKYb7RTKOMzpATaYhkcaTc4qTjtm5L09OOcthqMh7NLLrZsEQk2G1+Lkk
	 Y+DYqvfU8tDjFBSIFawpY7aADffQZ+Bw0mxChqyW1VH0t4OejveXoJFQcByDg3rR6qqyF
	 3TsapAeW9tjfJQewHoyM37n/hBV1388ByE9GHriqPOt5woY1/VK4SJjpaGWDrnRZaesfC
	 v6x3BsAFwFB/MTXFiPmdGtDg2LAjzkVamfJIRd1fWCNal46VHEq4CszQbWpzkDuSTbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794733535;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=tjOAhQdC0cg0LV1AxBgSqlMHlzoOkm0INHdUNMNhIOY=;
	b=5FO0pukpCTFh4I+8JGUIJGHnSm7IGQZ+u+THiW2EUwybROku/OhZUu7I312g4ern9lyi
	 1d4aowKwxgKk9yt+tZfwFATR9MmQ41k5srsYet+8Hn8Gj17QbgMG+TNwtxwumyTU3af9+
	 LKoLVcBgGnDm6J/a5a/OU5VFS3oL/pGSH6CS0/xI0NDK2tQwquNNEU1xCe8raKN5NUjHC
	 6qsQnBUi3UJFTGxlCNqMBf1kBrybo+ZBenmuW+yFfqbtcO7PXQfeqJUVAmCzWQC5EhMbH
	 5j/mbNvn6dlIxE4KjUzmNgxlkH6HA9qdtU36UKEPMlzP8NCmQtRGNaOJ+yoYCMfpXaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EMDUndlp;
	arc=none smtp.remote-ip=209.85.218.46
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81DF9606A336
	for <mfd@lists.linux.dev>; Sun, 15 Nov 2026 09:05:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81DF9606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EMDUndlp
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c4203bbb1e9so447133166b.3
        for <mfd@lists.linux.dev>; Sun, 15 Nov 2026 01:05:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794733533; x=1795338333; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tjOAhQdC0cg0LV1AxBgSqlMHlzoOkm0INHdUNMNhIOY=;
        b=EMDUndlp97taw1jJG04qWtiKmHj1LHRIJMLVYFgDvPKowNjWSApPU5UZ4jTX8FdEMb
         XLdXVOdNsdLEYX6e8Xz1v8hWnwkGZrp+tDnw6uvsAZLIaSc8Ei6ncoW9DiKa9TREIBxQ
         7oyf4SvZ3KzM/Pvfx7qCZxj/ayh9rVUrV1AOlm4FtykQNiibvwSYfwc0e3CUNSv+EczW
         icsSKGd6v695farotRgFo0WSWM6Fu1TgYsH1YRuJ7o8FUEMFHjuh5+BwZbZoRpJRx99z
         7GJjynUWL6AZKxq9WyMGoZocaQX2tvBKWgCVq+kDZO3oQXSE72OOn79PO9dN3uQI18sl
         hXNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794733533; x=1795338333;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tjOAhQdC0cg0LV1AxBgSqlMHlzoOkm0INHdUNMNhIOY=;
        b=Mv9hdarQArlD0vwzUcVe7l01jDT4bBdF2OUIEAnqIOtjHl9TApYnpN4teQdeHhdkMO
         gpXNHn88Vd7pJCzz9/lyKhVwKFZq/dHIli0jOMkfsLEQxJpx9bCUuT9GQfsa2HinfHw7
         8EcheMO97SZaZ5qX3LXCU5kbgQ1WHyPugeF1MRqsicLazZjQ3jur7X6rreJheUMMqV9J
         Gz4Je7yfe7kOtt/9qFtN627Mwep9BsMjILTulz13FQi+pFODpKSvC7BixdrMM2cyIsV4
         ZxNbJstjJkxVSva26NQSAkUfAdCRuSg5t0e3WVk0tlF6Yh16jjEVMH+YTgfSwDklb6nF
         OU6Q==
X-Forwarded-Encrypted: i=1; AL+hErE8fzmKgRu+rFGjBLS93mmgQTPk+5axqeD5YL/lSneLj3naEZ3tWJkzoDJHvG+oZ1mvb7s=@lists.linux.dev
X-Gm-Message-State: APuU4Z9S668leJh1TAIQ0GtrRsPkEpJnMuVEwq87Oz0VLhPasE5WbojT
	g/5ZvTvLpc1uDtdQVlbIugMhI2O7G37zL+TVjVUjv9Vi7T2hQWmcT7rS
X-Gm-Gg: AYBFou0TUe4XXmsWQ6C1GQV69FD6qaQMUm0qhszC/Ypke9m2HacfZDnt7s97RFhvEZ8
	b8jzt43klqduUy5aj9MF+gH7o5a0uEbErCuYzRDL0Pw+geOkGqXm5EOjn1UTDnUVtKOZBWc+zm2
	Q/GnHdHO5Id23uhzeLiTvI58lUxyFfLIKW335RqydRd8MBOfN8ie5GTS4maYjaM/9yN+D6GZ8CG
	3kKuWG89Xd746Bo+mMEYR/MkzRH+HFx6kFjaBx/iM0LVVR9io/H7UpCvwbVw5ZVGGUl7yO+ZHGH
	pWl+EE7jyOJqbA4VjS9iqo6YHUz77OKZtGdG51FYc0mMSUt25HufMuavm/Kf2buVcbYo1jK3icH
	Sv/tcAPcWKcDA10WhqbM15zQ+7lXOMHSywlDuIF32oGuH105laK/xb/a+GTjddI36MKXH8GJ4o2
	6bKnNifcwqwAoue1KSz46KG9aBsuKyLbfRbAWwIZZyDhXp+3/89NQs6+cYJWfPv+vI1TcqLP9do
	sXVaD5coIAQGz4Ud45eDGt2IphKHE4S5rBekL1kO/DbRROv0n9eoQaF8CQ/XzUq9H7Cbhi6Tc/L
	ufHwGBEVF7eDIjEoB/pkHV93PGCMZliPFc3YPhA3T01ZYsoBto1/eUjnII+kM9VLcBthkFl88Sp
	PeDSbKvcUGExjAZOEwF9yb7fWpbeZVOg=
X-Received: by 2002:a17:907:7296:b0:c40:aa04:18d5 with SMTP id a640c23a62f3a-c50963075ebmr684777566b.15.1794733532776;
        Sun, 15 Nov 2026 01:05:32 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095a5c4b7sm288103466b.1.2026.11.15.01.05.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 01:05:31 -0800 (PST)
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
Subject: [PATCH v6 1/3] regulator: dt-bindings: maxim,max8907: Document LED support
Date: Sun, 15 Nov 2026 11:05:18 +0200
Message-ID: <20261115090520.102216-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261115090520.102216-1-clamor95@gmail.com>
References: <20261115090520.102216-1-clamor95@gmail.com>
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

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
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

