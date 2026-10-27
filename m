Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793069178;
	b=YHrMHMLgee+heQ6kkTCJ49c18TiW814LD4q5ge7xpJxurLHpxat/wM/hoDvFz3XicUbs
	 d4QED0nnenCexc5GMpmrw0wyg9ocsZ3J7ESb9BmWMdYnY4B9oLm6IfX7BZdkT3quMH9up
	 o7YdVWany0T7xMLTysszB+SFy8BwGViX+tQlBME2dli2Loe6VYkGVkxUeatqbYt4sFpwm
	 5W8HGdD9a12EjiMB8n8tRnJktbEfaNPmi/G+d3GdtXfyYny1/rnrxAdZBMBz7HWUP1Xpb
	 z2P0TBS/4MG/AUwBJjEjsDrWedB3PFlxXrX76vWp3pLSeXPrClPOY1A8BikUltYB7dw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793069178;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=PGT+puAojXJ10M7d5F+nORTVc4mPik48tZJfhJIgcgQ=;
	b=iVs84hxUVWsfNJsrRngtBoyrpuGbG+ptwYLpT9sS+fzzbf7L8CA2mcxrhkPKOaOSDWeN
	 aNeAsi9sxAQ+mVo5KfGq9fWjhRzumzER7S4sC3YzsP70k6fexklQ/v/Mh9IEvG1fcImuf
	 mlaMJ9R94Dx1zjuWg/vpxSSd44CS41K3s6Mb7HYIzwLrxcl5BqiqscDTgNlToaUzj7EQU
	 COyYq9RKK/LlvZCy3WWY/9VZz4p1nM/D9ivh0XrWWcroUO23m3fbdLRKyrxlczZj9yF1l
	 ynpeKCHlKi3gNF3ME2YXHqONOlegkU0OMkq+Et95mxHwVIEC4m7vdKsJnHbaQswYzUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ghlnMz81;
	arc=none smtp.remote-ip=209.85.214.180
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 442FE606A31A
	for <mfd@lists.linux.dev>; Tue, 27 Oct 2026 02:46:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 442FE606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ghlnMz81
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2ea138a3497so23608555ad.2
        for <mfd@lists.linux.dev>; Mon, 26 Oct 2026 19:46:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793069177; x=1793673977; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PGT+puAojXJ10M7d5F+nORTVc4mPik48tZJfhJIgcgQ=;
        b=ghlnMz81+gYEICvJR60jhl83e2nexvt2J7wtKlouLqslL7Hq+8BFUCrV1ZHAY/F0KB
         pxSzxXS1jytgutqIRmso7lIbiW55YREL0pQU0v60gUPc8H3pKVKq7Ac0qsEiyDSIAn/E
         MNeWvA7kiOOR6GGsM4m7urcEoBZ1pYVFIJeDIjS3qRK3jcvM0YRmhjMhE7s6EmKg8aEw
         bCAGtY9axdhZ52v7iTwVmQJ9x6XlGWwsUE+T7ee7JcsX/gjHqRoIIkz6ZRFbDv5gaox5
         Rd0rMIqqXhnOTsOSKunyHeQ9Rgoav572mr+TDp/3UtM5PEk36gmSxK8XJiGzOiXaQQkh
         lcfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793069177; x=1793673977;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PGT+puAojXJ10M7d5F+nORTVc4mPik48tZJfhJIgcgQ=;
        b=CB3NJEQ1iyVXz7NWLGilcOZGsD0zDW+LvIVwv3XFi/Ij0RNW5pUcAt00X8rW7YANSo
         9BOmH4NawD8sQ8PxrdtuaBnWmk4QdZEOA2xCeVil1XbxY2Y4sC2z7i2TdMZj4Agh3+di
         fms11j+0I1RWJaOYvueaTf4m3wJIWQgCMqzhGAxKMIWcKFNQBitY5iQiencIK/D0zySY
         A6ujAH+o2tPOfKu1H3TNcgF7qPouFcfh0FmmtVbRLCTtguLTjjY994W7QLiRsV54z3NR
         BzupgmT6OlFLOyBEvazYNyb5neT6AOhZ+qqQc84Hw8PCydQpobtIJ5jauNxw6jBuGIQS
         TNcA==
X-Forwarded-Encrypted: i=1; AKwUvBx+R+TlrjqQeB9Nf+68CDeetVeM+dhwiCmc/zJWyKN91QDVDClvFN3CWec7vXnBNHPScy8=@lists.linux.dev
X-Gm-Message-State: AFq9FYKg2O8BDgmIZSlGmLtnIlzGaZyJp2mddzIlwO57IBbNZrDCFCXL
	Pz6zmtB5fFnSbyp/5+EZWb1ujM2aIrKQ8gvth4EmjCIGYdtbagBzXU79nr34iXz+SOA=
X-Gm-Gg: AYBFou0JHpipao0dBr/qjqbv09RMwitS1QmfeIcYgxJqw1zsLp+c+I9o8Iz3BsmcOOj
	UzH17LccXRGqxAyuL/qpuF+hhQETwaHf81HjU9wAoW4etD6x1vYwrAot7VazExzHzp4K62+ENQU
	WWTKw4W8Ab+p9Ujvw7bgPYhxtbQL7Sb3pvTwZgsPoJFgRCjf4xy03rc81Zoo2+BIacG7ZuGjLIM
	W2/T4vkZcZuohalmgtW2EcTuKyb8lZPbWm9NbtNi8IYyqFcstQDvFOo/lDd1417ScNX3K1CdBYh
	JKDtRvYhRlnGW5zZJCh6UxKz0iDbkkrLNFPla8/14UoyeVmtFfVJabYV1yj9V4CTIBoI4tll/LW
	4dUwzbuiL7aeM4j9Eswazb9W8ZBYSf8AEKA2eUNRR16PPFTHj2Wrtnj8hS7Kn7s4keIWd9IXSyu
	3yyzKPU3gWtl25YsPDfJgVWd6K0dJKIK3cMQN4a9GlgtoUQlo8kEWrXX19RH5Y+lFaTkA60OlI6
	XuFJOKRbTYdo5XCYMwDbmXKvXErbdhsdq2mR9Ni/8voKYhjiGk6EszS86VJFnvY2DCfo0TUC9Az
	A6/bCdPcr4j0+N3Mkzx8NbygXvo2
X-Received: by 2002:a17:902:ea12:b0:2e9:87a2:b4f8 with SMTP id d9443c01a7336-2ea9c83f108mr69673795ad.29.1793069176577;
        Mon, 26 Oct 2026 19:46:16 -0700 (PDT)
Received: from lgs.. ([101.76.249.61])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6bdd5cesm2324565ad.30.2026.10.26.19.46.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 19:46:16 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Lee Jones <lee@kernel.org>,
	John Stultz <john.stultz@linaro.org>,
	mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] mfd: hi655x-pmic: fix IRQ action memory leak on removal
Date: Tue, 27 Oct 2026 10:46:08 +0800
Message-ID: <20261027024609.117371-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
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

hi655x_pmic_remove() currently removes the regmap IRQ chip before
removing the MFD child devices. regmap_del_irq_chip() disposes the
child IRQ mappings and removes their IRQ descriptors.

The hi65xx-powerkey child registers interrupt handlers using
devm_request_any_context_irq(). During child device removal, the
device-managed cleanup calls free_irq(), but the corresponding IRQ
descriptors are no longer available. As a result, the allocated
struct irqaction objects referenced by irq_desc->action are not
freed, causing a memory leak.

Remove the MFD child devices first, allowing their device-managed
IRQ handlers to be released while the IRQ mappings are still valid.
Then remove the regmap IRQ chip and its IRQ domain.

This issue was found by our static analysis tool under development.

Fixes: eb10245fb37e ("mfd: hi655x-pmic: Add powerkey device to hi655x PMIC driver")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/mfd/hi655x-pmic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mfd/hi655x-pmic.c b/drivers/mfd/hi655x-pmic.c
index 5cb392892c19..3a7ccc9d30b7 100644
--- a/drivers/mfd/hi655x-pmic.c
+++ b/drivers/mfd/hi655x-pmic.c
@@ -147,8 +147,8 @@ static void hi655x_pmic_remove(struct platform_device *pdev)
 {
 	struct hi655x_pmic *pmic = platform_get_drvdata(pdev);
 
-	regmap_del_irq_chip(gpiod_to_irq(pmic->gpio), pmic->irq_data);
 	mfd_remove_devices(&pdev->dev);
+	regmap_del_irq_chip(gpiod_to_irq(pmic->gpio), pmic->irq_data);
 }
 
 static const struct of_device_id hi655x_pmic_match[] = {
-- 
2.43.0

