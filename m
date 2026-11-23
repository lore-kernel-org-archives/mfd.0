Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795432754;
	b=XTm/wQZRltvehBwZJA0Vgo/xlLYZhE1BhZgk5kP/tjQS0sCP7YsFJ7+ooVzfaSWnuteZ
	 Gs4ElLmeAHY440LRb65DiRYcBxAAVjM65eQeuN4q+rSn6+KhXCsLgchup4KggsHCbP1Fr
	 IQDSDenpNkEd8UnScp/bbz/TKd3sZPFeLS44e0OHFUxIqGlpHkVmFB5bkvOr0l7CdRA5J
	 0uEXVJToQbXXrGUw4d2eZhHsFKskAWSGXkaj8sssxMEhwyT85xFXbVJwT//99CCNI9sfx
	 n/gPxObVqHiwzt/ZwPK98ud06FKFezI7Q+FaAhG3JbqlI+652ldlfbWhXAlhSPcw0PA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795432754;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=M9BurEdxaULfUy86Tcm7upcSP8lXl15O4kiGDMc4hME=;
	b=ueyicGBXw42M/4+0fjUsLTyaVWBnsWEWqUAQ0vgXj9UHzIS7SoX+FpAU8vzBkdK4bmv7
	 jDRNYZsj3Vm5bVD25bhN1LuySQxa25NYtA7vKcoqh01TRbfCoWUgui9KjrOa6Tu/yPQTd
	 yWwBgVbmZVrprYNwBh0AvkYE/d80R131yTt7rx6z8nCkk3PeCao2Kr5mG5AuK4mX27xRy
	 UFHjipafMsI0YYnz1b0JRQpAAb1GSCrjU8xZftR1tKS+RgwAklXdF7+9lk0mz/8ais3dc
	 dNyqajnnBxIqFrf+X1q0gd7GU36Ro8FyPX+KXEm1VlLLJ4+u2dKPM+UlqPSRAG0Aw0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=mYLQ1kdS;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5F4160A3806
	for <mfd@lists.linux.dev>; Mon, 23 Nov 2026 11:19:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A5F4160A3806
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=mYLQ1kdS
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a2000d5fb1so17258265e9.1
        for <mfd@lists.linux.dev>; Mon, 23 Nov 2026 03:19:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795432752; x=1796037552; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=M9BurEdxaULfUy86Tcm7upcSP8lXl15O4kiGDMc4hME=;
        b=mYLQ1kdSLw4Z+KEtRI70fo8gzdeTR2dqwv6KLrdCyeBjosFIVNrpQX4pTEXQUGcUh0
         OUghTOD1bTI1AJS59PXoSdDOguzLo9KP63JwDHcwhLtZ48INMx9uv88WvcVruECYSxDt
         7dBZGKQb7vF8VoZ3XQsJVL/C104gkqqV9Iny63IQdk3uecqUFXWErpn+99gw1K1YSMOi
         mbveIq/Wj1c/kcBvFQLFCVea//mS5LT6UuEXxEMLQRaNM50nhfDPqnQcs5wtLkLhrGDf
         x1dybilMk80uZA2I1HMQM4SylIS/De2dpAX08/9eNFfWAWwLIofA/I5La/p+CS5CbJcK
         TUUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795432752; x=1796037552;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M9BurEdxaULfUy86Tcm7upcSP8lXl15O4kiGDMc4hME=;
        b=xMfkUBN+R/156h53/ZjDVHYHPrntdt5xDUTzDqDQQV75vK70hndslTH8St7LuwSTdB
         P5LERUi76nx5RYeRC9Ragr2ZX4gFXc8NiPkBoYELnDsLUkQOXwBsITsXFyC9BpMBWJEU
         DKGYV7JsTr1xcOkuQ24pQA+dTjW/NZOqKxSMFfhe3EnJkTxp5/BvYas1O6BzGNRN5Grg
         hiyeahQSGD+3HeCza2Ex7kPn32iXvm1atjmoVemaMq+QVBDGtNzI+PR0OIAs5utLrNDh
         ZRPXFenSdagZP4lNcL01cK5QfZV/aBuxRoL3Oh5U8EMfWEqST3DPdG1g5tTar4rw8OEB
         39uw==
X-Forwarded-Encrypted: i=1; AL+hErEttj/dHznZXTqi9XcVtrMwcsmQwqMH4rSds9e5PXaVPIiaXG33xslxnwEDOmrCKvEHgUQ=@lists.linux.dev
X-Gm-Message-State: APuU4Z9s22xJJ4G+gHJu6nSI524QwwAitd5akdyme0UKcjYMRJCPEXU9
	BkxMW2vq3xZaxgumWFMpvso9ZKyewWyq3iHQcaiPppKxZyDjthBGKLYBWK6YsLEnfDd1LYs6LqM
	JmC2H
X-Gm-Gg: AZFdTZfpy1Oj5MDi2APeiAQXk6TgFxmzt5QmirVyk9JOXne/GBOAh5iNxMOpD1pc6zl
	tZT/xHafDlyOzb5ujvSZktAJ528E1LSit0z9t2OvuiRRIiJtzeFyuXaQn6gC0TD0OvlP/H9PNCX
	O1xPhB3lUQqZ7b9udLOlcOdOyChRDA7ICGpLu8en7fyujhcdJ3AB8TT7QWQS+9mV+VzAZA5BLkb
	A+eVvf6jwXQmv1sm3inJ0cXZOYW4aKubGDgWqbSGDRcnZU+VUeR8fUv7Dco8F4GQ9Tj5cmJsBdl
	nXvmullbTY+fhpJnh0atszPNs70G7jTxRgYOlRt4uZIhMBWaW94zAWWqwKWm7/M+DYZ2zMRqgS3
	j/qgz1qkBbofgHR66mpYxP9uPrqA/OBruba/vQ/7tQ+rMkmz/xuLEqZdHZFti6DJ4uc6MfJgCIP
	8YnBNy2xutig/VwNTaAMDJ4Fhu3rVj5MmkKajIf4ERs8fZABAgcAh8/aHnNeGkGidjDBMxifFOs
	2Qp3wNrFjNlWuBk1KEc0JjqjZWpjQ2yRyBLa4UbrvfNT61khzVBZ88TevlKiEotDw8M4CrlldoP
	TnfYem2alyEGpPzLx4HBoLDvojBH3OkDrMvykufJzy9NU292r85GHiJPuVBnhrqHtnNsWgKKMVQ
	+HOpp0Kjj/rY8cmiG
X-Received: by 2002:a05:600c:4e8e:b0:4ba:59fa:510e with SMTP id 5b1f17b1804b1-4bb8893014dmr230811345e9.23.1795432751939;
        Mon, 23 Nov 2026 03:19:11 -0800 (PST)
Received: from localhost (p200300f65f19a90438645cebc2ee104e.dip0.t-ipconnect.de. [2003:f6:5f19:a904:3864:5ceb:c2ee:104e])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4bb906cdcc1sm160681095e9.2.2026.11.23.03.19.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 03:19:10 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Lee Jones <lee@kernel.org>
Cc: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	mfd@lists.linux.dev,
	chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Linus Walleij <linusw@kernel.org>
Subject: [PATCH v5 08/17] mfd: Drop unused assignment of platform_device_id driver data
Date: Mon, 23 Nov 2026 12:18:06 +0100
Message-ID:  <6d088972de962cd3b8a22926800e36defd268d97.1795431460.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1795431460.git.u.kleine-koenig@baylibre.com>
References: <cover.1795431460.git.u.kleine-koenig@baylibre.com>
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1406; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=OvFq0jqcix+nwy/hTUrsl7qFm0ROsXuuz2q1RVingjQ=; b=kA0DAAoBj4D7WH0S/k4ByyZiAGsEIPvISAODgKyfpgbjFnyiCAHcQ7IbFHzgEvRZzaz3yy47u YkBMwQAAQoAHRYhBD+BrGk6eh5Zia3+04+A+1h9Ev5OBQJrBCD7AAoJEI+A+1h9Ev5OguoH/1w9 aQiu905LCob4dh8+UJ0quimfHVX9xW7+i57G0S8G2aVJctqf2euVKBSoxeeSo8zEke4pt4akQS6 fJ51B0cHc8thdTMyKEvvqix6mrX+xyKcVQqmq9lHk/m6n71IDFR+XBKvle9oQJaeZnQGiry1mC5 9hKGlxP9dWv4btXVIModwmGhL+nQLu27g8zlS4yCW3JbqOHO2j9R3gWD6EBfus+x4M1eQaAv6Zo x5vYa6z7z7lbQ5+suCKrVLirWylLU7XYuzMFyPb5zxB6Sf+qTBKk9cJNzgsawDWKCbigX8sw4iU BQpqVjVQ84v/zNG4tyEpOu3AkqJKnJGD/7SiVm4=
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

From: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>

The drivers explicitly set the .driver_data member of struct
platform_device_id to zero without relying on that value. Drop these
unused assignments

This patch doesn't modify the compiled arrays, only their representation
in source form benefits.

Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/mfd/cros_ec_dev.c | 2 +-
 drivers/mfd/mt6397-core.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mfd/cros_ec_dev.c b/drivers/mfd/cros_ec_dev.c
index 529a23b804f7..96aac158fd8b 100644
--- a/drivers/mfd/cros_ec_dev.c
+++ b/drivers/mfd/cros_ec_dev.c
@@ -379,7 +379,7 @@ static void ec_device_remove(struct platform_device *pdev)
 }
 
 static const struct platform_device_id cros_ec_id[] = {
-	{ DRV_NAME, 0 },
+	{ DRV_NAME },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(platform, cros_ec_id);
diff --git a/drivers/mfd/mt6397-core.c b/drivers/mfd/mt6397-core.c
index e2f6315f7da8..816ddfe1584a 100644
--- a/drivers/mfd/mt6397-core.c
+++ b/drivers/mfd/mt6397-core.c
@@ -327,7 +327,7 @@ static const struct of_device_id mt6397_of_match[] = {
 MODULE_DEVICE_TABLE(of, mt6397_of_match);
 
 static const struct platform_device_id mt6397_id[] = {
-	{ "mt6397", 0 },
+	{ "mt6397" },
 	{ },
 };
 MODULE_DEVICE_TABLE(platform, mt6397_id);
-- 
2.47.3

