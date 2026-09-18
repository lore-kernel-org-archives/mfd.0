Received: from mail-oi2-f10.google.com (mail-oi2-f10.google.com [74.125.231.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4190B3C942C
	for <mfd@lists.linux.dev>; Fri, 18 Sep 2026 02:20:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789698026; cv=none; b=B2/l1kPP35k6n0WRZ31nxfGlFM1a612cA7hnZShXIkiHZImDaEhqIrCg8OEWbiwE2Sk+M0KXCibtnDztxbQMwmnz4ulIpqyV/U97qHtmoMBFNREEIhmKJv1wjmhbKOK1SPcnCgLPxGCkuP3rKi3mNWPLsKCm1fNJ53ZIdE8cLDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789698026; c=relaxed/simple;
	bh=1otP8UYV9viBZZ+f8NwjITACufQDeLB/kdjE9I9R9IM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AEF0cI8dxZ0GTet4p6IUJjlS8GSHKCeniE/8a2NhXYCU8oOpYmdaBb63mgfq9ERfogNeAaqgs2f11On+aHDrFPkBiCTYMs8wpd+2Ua+bKpuXkH2VE9LQG+XWwsR0NayY9Uy8O8eK7Q1sLzOiNUh3YKYldj+lgxoPW+ai6AooWds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sDaqRIP8; arc=none smtp.client-ip=74.125.231.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sDaqRIP8"
Received: by mail-oi2-f10.google.com with SMTP id 5614622812f47-4c3bb46aaf0so125468b6e.1
        for <mfd@lists.linux.dev>; Thu, 17 Sep 2026 19:20:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789698015; x=1790302815; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=54xUl28tB3oyyAr/XFRTTgMHGsQTvwV3/5B41pgtCxk=;
        b=sDaqRIP8OY1wjG/ZvzlBQQK2tvugNdb5351uDJd6SNcIurnTe052Vsehh2UPPDjsKc
         RWAmfThIzvX8EiAYduulyTQ0YAB0lk4Lxb8AUIMS4M79lQ73ZvSrmMxCb2MX/cZS6973
         fJ3HizTm7PWVH93HGfS/UrdscYEULHP1A5BWuuJ98go0y+GKC2US3wIfgLAIZjz/gbQ7
         kLPOc4WaDBHQEp6IOtOU2IZp0mP8+399ytYsvPaMmVewaz74zqiRDoGhtaBxnTjqRUlO
         iMmCmZfHtjS0FvN1C4X8BmZK1S9pAj2HUVrGbgPvr7vOOjAgW8b0vhsHNjYIcJEYQemH
         A4Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789698015; x=1790302815;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=54xUl28tB3oyyAr/XFRTTgMHGsQTvwV3/5B41pgtCxk=;
        b=SjQ/eOPu057YHW97DOmTmYoGVk3yOGqM25W25bPXVqCOzJdAiHCln/VkYXLfNFULGX
         QFmpE1gy6a0NFCMozq2RcnrzS+ROgWQ+MUfFuamfEwPWQAdtWDqoP7C035NOQVyFjlGF
         CoM6av9RjAGJyZ2kEReysctCWxREQRcnYlKG6gRlV951+ydCxp9aASTPhGF8NmuFag1/
         WSY6+tOBpYcCGudceeJCsfGuxsUG48ujeZQ4dg61VkY7KKRYkZtwPdQqj5dvw+aOn8NH
         9Y3Sqya0Ybh46X3IidWibW8TR6TNbfjYUHVjP7XcP/cnyOY3G6v26GsjMvv2rLdgrUta
         XGzw==
X-Forwarded-Encrypted: i=1; AKwUvBwsEV0RZSEwSD2twJdNFp4HtiFBe0Eo9dIKxja789xNZ+l1jtYPw4NYKVUPr0zRKhBQKv4=@lists.linux.dev
X-Gm-Message-State: AFuF++nkiOAdpuW2SwPpTTTAR9EFPfmQnoZuQGJ+OI/uuT8cLMA4GXGv
	vRKL3P90IqO05h4GF7V742Vtk4JVMNH5KU9X73YwW6bAIJOXgBhc3vk8
X-Gm-Gg: AYBFou0ev39eIzR6lKcmRHxF3i+jQk8vVb5Les2RuOsU/FxguFBUrz+o/j6iXU9HLZj
	3vpRbzVJiuHxh9H+W/fHJTjBKEVr5aJd1W+x4FPWFG2mFzy8wCmZ99QnCyFfHsqQmnH9I0PcaKh
	zNTUjRhgSvkBVv1Iz7pzG4SkZU3XmcBUpwJG8xWgg6ldXbkvfwJAvzj1/7dN8IfnEaUXEbdFzYM
	36xb6pqberVkUxxn3gxmkC5kF3q35MP8cJKJKohy2CLEIvscIe/QlCjlUnFPlM34HvI0bBvGXtm
	Uw76Mr0A/wZjSnhfaj67cVuOVJZCzdYU/Wd2G6TOATtsF9pBjGjywtFMEpPIxdHrXPNmrzoa4gS
	oYzQMoHr2DZMpNLxENDEpA2lG1c66vK/DX7jyMbIJoXAqUm6ZPQz7pL/eZVPeEiZgXj2dzPdVO5
	X3MdyHeeIn8y6RrdeRay1H+F0mjx+DI9pz0Pvk5dTg2CmGasaIy+kW5pi49IDkCR1zbA==
X-Received: by 2002:a05:6808:bc2:b0:4cb:f21b:6f98 with SMTP id 5614622812f47-4ccf9b8f79bmr1640523b6e.43.1789698015057;
        Thu, 17 Sep 2026 19:20:15 -0700 (PDT)
Received: from [192.168.18.164] ([2600:8804:5716:d800::b712])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-80e5226786csm295476a34.22.2026.09.17.19.20.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 19:20:14 -0700 (PDT)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Thu, 17 Sep 2026 21:19:52 -0500
Subject: [PATCH v2 3/3] mfd: mt6397-core: Add mt6397 AUXADC support
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-rbrue-suez-upstreaming-mt6397-auxadc-v2-3-db35882a6080@gmail.com>
References: <20260917-rbrue-suez-upstreaming-mt6397-auxadc-v2-0-db35882a6080@gmail.com>
In-Reply-To: <20260917-rbrue-suez-upstreaming-mt6397-auxadc-v2-0-db35882a6080@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Lee Jones <lee@kernel.org>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, mfd@lists.linux.dev, 
 Roman Vivchar <rva333@protonmail.com>, 
 Luca Leonardo Scorcia <l.scorcia@gmail.com>, 
 Andy Shevchenko <andriy.shevchenko@intel.com>, 
 Ryan Brue <ryanbrue.dev@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789698008; l=822;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=1otP8UYV9viBZZ+f8NwjITACufQDeLB/kdjE9I9R9IM=;
 b=5AvlTzf3l8b4LLef4GkI1AU4KWt0gDt38qriJ2bzdYxbLUme++T/DOctXG9bxd6ylcEF2KKoj
 2xObESmwo23CDAaFIvEw6+yWIBFc38l1dxVsxUSc08ka11Xc1GqGfja
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=

The mt6397 PMIC includes an AUXADC. Register the AUXADC in the mt6397
devices array to allow the corresponding driver to probe using compatible
string.

Assisted-by: LLM
Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
 drivers/mfd/mt6397-core.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/mfd/mt6397-core.c b/drivers/mfd/mt6397-core.c
index 9ec951996588..5d5f816492aa 100644
--- a/drivers/mfd/mt6397-core.c
+++ b/drivers/mfd/mt6397-core.c
@@ -261,6 +261,9 @@ static const struct mfd_cell mt6359_devs[] = {
 
 static const struct mfd_cell mt6397_devs[] = {
 	{
+		.name = "mt6397-auxadc",
+		.of_compatible = "mediatek,mt6397-auxadc",
+	}, {
 		.name = "mt6397-rtc",
 		.num_resources = ARRAY_SIZE(mt6397_rtc_resources),
 		.resources = mt6397_rtc_resources,

-- 
2.55.0

