Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CDD0435EF3
	for <mfd@lists.linux.dev>; Thu,  9 Jul 2026 17:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783616413; cv=none; b=ruJzrPjHlzNksnYUQmXImZgPAcjgdTK77emb8eKKH8K1Dq7tLKXP47zZ8MLiEEx71uwsWeAWF+UBG7bb1kfR9cHEpU7b6D6Fj+qanaljpAGc89pNwpQSFQ9eiNTDVlPBivS1u69ugxdKC2BwvasnGn67+SYqOpwK4Ej+G2ghPuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783616413; c=relaxed/simple;
	bh=6qbdlzxZyZLMBPwj2Zmz1sZXp72LcZLMsWmZZfgKkIw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NnZHJQaz5F7a7VOQhGRKVQcH6kL4hdFjaQyWeucbFsMu62TY5OaCSRUbboVb6HxUQwAWIAIfenvCw+MNXcHs21v3c8MYjz0cQdbky4Dn/zIWOnAIH6BCY5jGJJcPSHMyDCqPhkFQHI75f5qVCHnwPA+o+kWrtKVt8UCqPN1uGZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=Sojg+B+t; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="Sojg+B+t"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-4629051c9d1so79235f8f.2
        for <mfd@lists.linux.dev>; Thu, 09 Jul 2026 10:00:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783616411; x=1784221211; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TaCMfmYh26EG6vWNYZX/3pfm5a0Em0kXW/5DfKVSZ90=;
        b=Sojg+B+t3SqtqsNxgZvd6NJB3V4TV7mJDOKYarqg1eQPNvyY3Txjh868HA6gCd+lXK
         I9GYyMt6J3+ThYjhvNe+qyU6qr4JTrXldCpI4/4RUFtX8BJLGpANvgc2BPuvKEmCQlil
         O1yXc1HoWplgdLgn7U55oKn026rjJExcSMIQHaesv+Ud+NQvQvTKYVs/k7zJwzVidehv
         Zaf6IH2bDQEi9ZJjGSoHJAb7/nIfo1B8fJsHY3nb4w7cUifg6wG66C8e//sgAyQomO/5
         BEs/55ylEJXH1TWORnNgvHkeDBKiYzVcCUXSBKspAkrm1hgEx6OuhErrbVyt9bWTplou
         p4ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783616411; x=1784221211;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TaCMfmYh26EG6vWNYZX/3pfm5a0Em0kXW/5DfKVSZ90=;
        b=TGLOau79DMVgWacscKMFfdtpgs8INr4xrfctM90di5QNwCMne/tZR5yPCovwjK0FuU
         0T0bg3e+XRh4To3g55MJGtc59nNWZPoqkTH9dzzPwlZz0q3W7nDs6SseKgEs28h/0+Aj
         SaETcin2tZID4i6bdmu8Z5SYawEZbGGciK6GXOnDXgb3c7LkPYZR/pXSAw9DZtMPVoz+
         6KkYLI4DGy8Jr5glTrAclkPHLnUh7Gxw9eeSES0HCh+LdphAKEeQHiaUWZUXtkBVWjKk
         dVVn2qGgTXBhCV8fHzrupXOJ18rTHX1C/M+HAquvDbg5TM3n3OH4EjGyDkUJSuhvR2tK
         gG7w==
X-Forwarded-Encrypted: i=1; AHgh+RpR2I1IYfXBgltJPNOjJ/fGVHGxe0cYsmEm73zRB6nZmI2eQ/PTcI06MHt1kKakB1zvi9s=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy16u2vWx+75Y3z/z9kamtyRvd7a79UHeK4aV2rwUjMjfOMmbbc
	AYGm25cZx2XLypDz1ih1n8c9ZUTPd93+IrL1jDYsW5kD2oGf5C3XQYynLbBVN8NhIv1qytXfPXh
	qXjO/
X-Gm-Gg: AfdE7cnULyggezasxNnosi57h9YB3o8GAr8Ci6wlr8tV70qfFSvvVk5j4JEY7fgSwnC
	quQu35Tf59J7qWusYot/Liu57f1qJb7DurPMwnm7Fza3yv2/d7A/QgPEOpnutWg6/PvsbfpyAPP
	JzzegnbZxAnc0xAdaAyR63KMQWFZGi24GkEh+B3Nb+21EcsNdgj5RFteu58Wj8jlkDiI50wgOMT
	VTM5nDGEhfSuKD8rlRcoOKHzoETdRGwI0fg57OkW7+GgXeH17PCCir2QK3rWNCf563q/kWry71d
	T7Yjqn5/8Jdrmktx+ILSM+zU6YRCi8+scSibqILguzqKxrWXTEjv9eJzDeAJIVyGxdy/Oj8fO76
	IA9paNPvBiEbGfSMn4eqW6d83fpxojJCWYv7S0jqAyswgu0D5l+9qPsujAiGwx6/9YKxN1kbOSO
	kT57El/FTDXlffrxkqg4q7F22iQCChp4pxSIDWWehX5yA8UsT2gAlRt2C426AdL+Og3tiSdgjBM
	/0d
X-Received: by 2002:a5d:64cc:0:b0:473:d65d:49c1 with SMTP id ffacd0b85a97d-47df07ec87amr8676502f8f.32.1783616410760;
        Thu, 09 Jul 2026 10:00:10 -0700 (PDT)
Received: from localhost (p200300f65f47db043de98c19b374aa68.dip0.t-ipconnect.de. [2003:f6:5f47:db04:3de9:8c19:b374:aa68])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47aa0960816sm50766585f8f.29.2026.07.09.10.00.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 10:00:09 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Lee Jones <lee@kernel.org>
Cc: Qunqin Zhao <zhaoqunqin@loongson.cn>,
	linux-crypto@vger.kernel.org,
	mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 07/23] mfd: loongson-se: Drop unused assignment of acpi_device_id driver data
Date: Thu,  9 Jul 2026 18:58:26 +0200
Message-ID:  <8eedf9c9d52ac6a6924655218cd65b4021ce90da.1783615311.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.55.0.11.g153666a7d9bb
In-Reply-To: <cover.1783615311.git.u.kleine-koenig@baylibre.com>
References: <cover.1783615311.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=884; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=6qbdlzxZyZLMBPwj2Zmz1sZXp72LcZLMsWmZZfgKkIw=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqT9NCqbo1sjMKTHDdATw2XxwlRegBmMB56r07F YiV9ecB2ryJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCak/TQgAKCRCPgPtYfRL+ TrylB/0YihHTDoWV53qiQX8QgrMZUV7ShYrYeFCTLpS5MVZHwa0Eolj9V0tqDgHwaVItR2eICj1 8965JJT4akpJFKb3j4W1qsvWrnnd4K1hlcF3khlekv9sxshEYDxuL1UsTUVfa3QERdMUATtTA4P cEoTO3rhBC770zXpY2pMbZCd2Tg4AinlsfvbTDR8k4x0KZbTD/U7ThJ5IBu8tZzOGoH4uxbB3YC BWL02vf7d2eLnrqa7WgBWHXuaJa1DU/KIpbV/MZyoSVZIXIXwYgLq/TMDeNSdeLuIruOASwfsIc Iqls5A/oLorr35m6UYJSS3ttjDvWhgqUecJSlt3lbl8guQLP
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

The driver explicitly set the .driver_data member of struct
acpi_device_id to zero without relying on that value. Drop this unused
assignment.

This patch doesn't modify the compiled array, only its representation in
source form benefits.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/mfd/loongson-se.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mfd/loongson-se.c b/drivers/mfd/loongson-se.c
index 3902ba377d69..4c668e2d2241 100644
--- a/drivers/mfd/loongson-se.c
+++ b/drivers/mfd/loongson-se.c
@@ -233,7 +233,7 @@ static int loongson_se_probe(struct platform_device *pdev)
 }
 
 static const struct acpi_device_id loongson_se_acpi_match[] = {
-	{ "LOON0011", 0 },
+	{ "LOON0011" },
 	{ }
 };
 MODULE_DEVICE_TABLE(acpi, loongson_se_acpi_match);
-- 
2.55.0.11.g153666a7d9bb

