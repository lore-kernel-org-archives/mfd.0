Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794150859;
	b=W1ZW0zDxSpqA/hXcDaiMBmIjtEDBKg3ZBxsDx+koN1qsqLOuUYhpHOw5WZbwo2oH8OUC
	 poBHplqQnV73QEmHmyqJOQThlyp13Wml1fWRiTOVLRjR+YDr4T7iBUfQOuUgXhTlceZn0
	 F93K/VRTOWdf3YyzkK1GS7fY1U7cJdiHQNyLl7eEMg4iMaOqQEvtkNmlx1IXN4OptxD9A
	 xdwTx+88FMdeESw/I5CuE2S3CY38wZk31vR9Gebj0niIahb/C2Jh3CVMauaHNE43UV3ZL
	 GQXFd6xF/tdNAytquHYWPBpNmqzEdVdr4FPfd5U7IxYRdydII3X4gpLbnSoPV8E7xiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794150859;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=+v214Dro7nadIKB3P9+8aKqFMugLXZGhMQ9khVmC52A=;
	b=ppEIcVoqhS7L6kXCveY9brYuRUWdozrnQ1cT74vsEKAir85S63G6ZDD1sW6C/psa0fQk
	 w4NDBuKQu98N1XUpMw1E6U2gvoo2VZP9TJy37Pe261kQM5tR4WceHW286TOCh+VfM4IVE
	 ZaU2mtIJT0dsXse8gIvywmTCjsQ67mbEJ/dEldyrIABN6jhel/RDWDIgUr8lOfHupoBZe
	 6/s08YTjXU8cHvTOVXnfixn1Vj508iggxnQjoARZQtRTX4Wx72seHbrrPIhewZFCwF0fj
	 CP+Idxg95ds3KW4Z2IV39sngAIVaZtCWy/p0aPUa5Ln0ufsHNdhojKRkzASgruXJ09Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MzsOwk0O;
	arc=none smtp.remote-ip=209.85.218.43
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30D18606A33B
	for <mfd@lists.linux.dev>; Sun,  8 Nov 2026 15:14:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30D18606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MzsOwk0O
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c4d28f75d62so17734566b.0
        for <mfd@lists.linux.dev>; Sun, 08 Nov 2026 07:14:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794150857; x=1794755657; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+v214Dro7nadIKB3P9+8aKqFMugLXZGhMQ9khVmC52A=;
        b=MzsOwk0O7MqTN5l2eAIKJucBRcE32JipWNlW+L7V9diWV6PBJDvhkeWLSfKu20cQCR
         Fd/mz7VpXWe9UMqHqg4axQzt4WK7nzeDvQCe+Zdeuz/cTK7t0+jU8QZgYUaYoUv4ga9i
         cmwNbSyk0xnJKFQkb0aOYedakS8yF+VSBwMOH2xmzuXVH0rJ2b2wJAo96g4brwCN/hqf
         xuPr20OSDqqcnpArttSe+QnN+BecjmAzxFyweWwZt6oItQGxkXhkEANZwZAV1zItH44W
         yOalyrIzsK0T8kPOBHyHCY/iYJ0ReUuKOLkONHfdB/9OG5KRoaQ/lzL8gqHAuueE9kU/
         1peQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794150857; x=1794755657;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+v214Dro7nadIKB3P9+8aKqFMugLXZGhMQ9khVmC52A=;
        b=zyJIWfnjYxC0t5pmGj21KGCLXBjvH7RlFPIzLy99Zf4X//u7rxqr8zUIjsxEx6FaRR
         TQNIyZ6pZefI7nUuTe88C4ZquqE1fr9LnWV/43bBZumPgrhwvgOoQOxsHl9m9398FFx3
         8e4Pg1PqK9zN4q7k+ZwiVLftwd5qIXUSfzu7/MkF//LxBkvPOVYTeNUNfJLNYWyp3wqQ
         6xt1G8OJX+7sgEY8syl39pfDyjoANFWjZhoO79ryY2aS5ulvmzgDVxeAUFXyHbs/bPu3
         n5HlMunS6eD5+vtpSaDvM10xigbksJjYZqqoEsGsECDDbz82OFRjXFexYb6I231UyPYi
         eFug==
X-Forwarded-Encrypted: i=1; AL+hErFsmc6NUDu5iL0fwqFJjPW01mTqAO5YWAEcxRR8EOO1uXUVFqKvHMJouUYSTkNnS0x2plY=@lists.linux.dev
X-Gm-Message-State: APuU4Z/+fxcajya2QZFqpRbqIS+lnCOb6iLrVYY7RckqjeWdZlvQuBnS
	wZ3h3NFVfa55xoZrw+BbE/FJefZFppdESFL9+GOREzcrxkAI6cuQ50wD
X-Gm-Gg: AYBFou2IdH6TxmUGcqdWhn1sOlz+IZV0S35GSx1HF6AdJWbOi9CL2sTmkYquvs56wIC
	srod1PYMx/fTg+nnxZChnTndra9Dso7l6AblW7tA6ZuLlqVdMY/xNFF2MJjqnpHpyao1pAxjhAG
	DQwbYM8i4XWIjfyH4h2iEDK0sn4rySK51hgcyeinNlF+RvETGMybGe8lmLctosoWbJuDhCnYfsB
	giNOxWg7/JZlOvWzVWVIVLyl5NjzkFWH5rJXVpmfdNcuwtMIWigpHWPACJElpVpwK1o0xqTnlIG
	vCP1ZAH56QRUU4GeKd9dFQPm65j50Minkt+an76CtbXQNnAEeZ7c5Qvc7Z0Q2l9Su98Floe4Ktk
	ip3gU417Tj5yPr2IK6TDoDI1nDQaK7SIb7rHM5rtDuOakfXrRs+AIT1YfHkWhUSUwZXdLN3RZUu
	BvDrunuBwHUWwHj9B37s1o3RCTIeSdzg6QGLiBjNJrE4r1oTYfShThvxkxnM/FtlXbGiecqy/Ve
	RiSWIk2hmfCDiQBVBQceL8R2bDNQb2Xz3zhQdfNdhvNIIjXsnbzypn6gdMEFWlDDKAUeGA41aqg
	Vw6Vjvm/ex7WHbqLmWuSTIe8Y8AVLvllDAEQa06aUbpo4Lgf9zsZtLSExsaGmyVRR1Dz05j8JkR
	iQJ6AaKZlJw==
X-Received: by 2002:a17:906:7308:b0:c49:9632:9280 with SMTP id a640c23a62f3a-c4d6d8d6fbbmr119323666b.46.1794150857516;
        Sun, 08 Nov 2026 07:14:17 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d6a978892sm69689966b.58.2026.11.08.07.14.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 07:14:15 -0800 (PST)
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
Subject: [PATCH v5 3/3] mfd: max8907: Add LED cell
Date: Sun,  8 Nov 2026 17:13:48 +0200
Message-ID: <20261108151348.204182-4-clamor95@gmail.com>
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

Add the LED cell name to the list of MAX8907 cells.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/mfd/max8907.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mfd/max8907.c b/drivers/mfd/max8907.c
index e282dd82ece69..826d7768fd8d0 100644
--- a/drivers/mfd/max8907.c
+++ b/drivers/mfd/max8907.c
@@ -20,6 +20,7 @@
 #include <linux/slab.h>
 
 static const struct mfd_cell max8907_cells[] = {
+	{ .name = "max8907-leds", },
 	{ .name = "max8907-regulator", },
 	{ .name = "max8907-rtc", },
 };
-- 
2.53.0

