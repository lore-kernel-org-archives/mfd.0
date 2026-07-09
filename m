Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F1E34343E0
	for <mfd@lists.linux.dev>; Thu,  9 Jul 2026 17:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783616424; cv=none; b=W4GoHi/isZTMLz6B+LgM+RU9C+CjXwa669f+UXjEhQWg4Eiy2HF5lOszJapwByz5B5w6z6PGOwlFkIxsw+VUsnEZR0J0J+sTNj1feTmXiNoL4V2Y4h3DwayZISiHm7BrewT4oqAiisaXdYFAX4dzWr/Y2JKG0gFeBuTjQ2NRoQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783616424; c=relaxed/simple;
	bh=5Z3Kjl/qu9frpgrxoaG1cnOIH3FkXrIBBkNKOC5hW3c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jqy5sCdf1g4b0uUMKFlBiD2IZyZsjA1jBpFY3z3NfqUVbAKWryVQEIF7GjPUfEXixuD5yyu/1imJxK4z3ljq2Pd0SnSysAKG6PQwVFkW4lg4BOetlNY6IvdMXwEwz3JMVhhUNhJz7uHJpvxsFchvde/52pLOkkws2uwL+WIthiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=JclWcnXH; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="JclWcnXH"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-474560436c3so129374f8f.0
        for <mfd@lists.linux.dev>; Thu, 09 Jul 2026 10:00:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783616422; x=1784221222; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0TFkb3R/mOGWcRcL3Ri0plY/8Hyf0vzpp7+I4ubysSE=;
        b=JclWcnXH2y46aWdMWpcp4DWENv9/0tanPtWvF+nHY5DrP6fpWGRwHN3siLA3ceMr5k
         dB40TF9BVN2S5yyo4WQJxvSpfEE1NNzW9zFPRLZptHMfcyR0h7vNBacBpxA77PY1EbNv
         2ndbztoWTL5gxmxZNL+zXgxzR0q3zV4U20yCmYQ+7Odx5OTtvbBsWM8xKT7X16T9aFqw
         jiD1QT3yV8wBvBpUFeb1L9YvnyXVFibkliw/cyHO4Uxbct7xGl0lVSoLAzh7Ht+FAQ3P
         iT/VDjVJvefJRewAKz+EPF+Fe2O5AI1dL3aUmWYC0k/lvqE2k0TEHfth3FVGDvd1724z
         KNNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783616422; x=1784221222;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0TFkb3R/mOGWcRcL3Ri0plY/8Hyf0vzpp7+I4ubysSE=;
        b=Jrjez3ctlU9ZLyEA1w4nLSuCPp7O1Hnzm3/CguZo8Fr4AfNPmSeAk/AWEHMk+BwW3R
         wrglPYftFKJDmlLgAciDkMxYH1rVUhqxBEH8IXLZyP1I4opPe/36Yb1DqLxRmcdYza0V
         Ga17zdoVCALOtU/QrDw3VutyPn5nQjGtMMK+tjHuneZNGZQwDMlg2rbSVHzE+aEOeezs
         v1EA5bu6CboCS3eK8x8Rezbvt8UpAPvGar7rDyeibt/Q6OHru+uis8gjYZqK1ykGXFVZ
         09AwjDiCpFPVrV0EL4BEohixCWXxMxfDaw+r7LJo9lUMlHMZErIdgzUMK5oFzuUe85T9
         ft8Q==
X-Forwarded-Encrypted: i=1; AHgh+RoDGWeQgfSuXgTojz0zp7Qhz2NlkFcd63LqYBOadIZTGR8C8HwHXYhXmC7rS4DO1/rVxs4=@lists.linux.dev
X-Gm-Message-State: AOJu0YyOPZ6404IdnjWIY6CRrddVYguImQ/94FxBnQZwYzvKhQA6dAFh
	i6THoHdvKRUsa5dIyBQZjtpyjqP3di0s6K/UJRQvqrYa2O43xtXgPIJY8dc/U7OKMrM=
X-Gm-Gg: AfdE7clw22DM7H8mqqmO88VgVakR/C3tcz70/lch3NDqgPqdVnGTAuFoYGkxxTLkSkW
	nOsHNfJfAEEj2Q3uqhJbmhJJyrV8x2Vnsx+JGkGoy9SBVA8WvVko2vmPucFk3IEp5Wkry5K4Ef+
	5WG1Z/+dP48oCgBp4drVBDSWOhSEq0Cw6tgWuWuusqUUNlHCy5jq8XyGULrVtyJGUFnz17WSQep
	4BaiZVTg1mvk91BKTRtYctapvgVlNvnOuPnhVyMyN9164dXxG+u4zxMatEUp5IVw0kIZ3Whxn7i
	vOFWfllviHwZZxnXfn6CcVNLjR23OqyTbL6y1S5rxnY5WZV8VIdkRCuET9fzfNFB3thJo4DDWZi
	xu/+EmRkVvLD87whQ3f8di77f6W3nZcCc5xtxcNQ3sJfqVzMgc0EQlkd+pYcECYGcw4v5xCYY1j
	cHQwyfVRzgIzyypvFDcIic0DBiSv0u2HlgxQiStev6uyhFvSJgX3u02QpswAxhp/++ON0MEuHlw
	HW1
X-Received: by 2002:a05:6000:290f:b0:473:c18:f2cb with SMTP id ffacd0b85a97d-47df075637dmr8971205f8f.18.1783616421491;
        Thu, 09 Jul 2026 10:00:21 -0700 (PDT)
Received: from localhost (p200300f65f47db043de98c19b374aa68.dip0.t-ipconnect.de. [2003:f6:5f47:db04:3de9:8c19:b374:aa68])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47a9de1e785sm52657613f8f.8.2026.07.09.10.00.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 10:00:20 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Lee Jones <lee@kernel.org>
Cc: Xu Yilun <yilun.xu@intel.com>,
	Tom Rix <trix@redhat.com>,
	mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 12/23] mfd: intel-m10-bmc-pmci: Use named initializers for dfl_device_id array
Date: Thu,  9 Jul 2026 18:58:31 +0200
Message-ID:  <33ec4337624f50d718499d77a8481a6010fe7a7f.1783615311.git.u.kleine-koenig@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1254; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=5Z3Kjl/qu9frpgrxoaG1cnOIH3FkXrIBBkNKOC5hW3c=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqT9NPQdL+kfSMB9uHcDmaPe3E+HKO9Sfr6o2CZ OT+LbnjPLCJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCak/TTwAKCRCPgPtYfRL+ TmC5CACejX/cRsHRM996yCBZnGYcfv8SrPXED5G+q/1xmsgBMZpW26DlMM2ZGG4BMGqdfmHbKyg rBl2cpjxXSHysWiAfLWiI6NX8i3gkCrXsal4OXPJBohwPJLbpCKeKdv/Q/0Ux/OGc/GWcAuLdje zegdDHWAc4/fb/c8fLVUgpbCs5Fk0WZC5lHb6hIIOtHF6J+zg0tXDX/TYDnSprr+LX9TZoeo3bL DIPz5+vq7XiieLWkj2CQOGLSJ0AWUoVtLsVXR9bAWDs9CxY+kH7AgcXL0SgOO+7I7TawYJfQqL9 R8qVj/cqP1brjr1XqJeDAt+H4qoxSw63PCQtbSURyIbj+LzR
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

While being less compact, using named initializers allows to more easily
see which members of the structs are assigned which value without having
to lookup the declaration of the struct. And it's also more robust
against changes to the struct definition.

The mentioned robustness is relevant for a planned change to struct
dfl_device_id that replaces .driver_data by an anonymous union.

This patch doesn't modify the compiled array, only its representation
in source form benefits.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/mfd/intel-m10-bmc-pmci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mfd/intel-m10-bmc-pmci.c b/drivers/mfd/intel-m10-bmc-pmci.c
index d213c6ec04ba..f78309bbabfd 100644
--- a/drivers/mfd/intel-m10-bmc-pmci.c
+++ b/drivers/mfd/intel-m10-bmc-pmci.c
@@ -434,7 +434,7 @@ static void m10bmc_pmci_remove(struct dfl_device *ddev)
 #define FME_FEATURE_ID_M10BMC_PMCI	0x12
 
 static const struct dfl_device_id m10bmc_pmci_ids[] = {
-	{ FME_ID, FME_FEATURE_ID_M10BMC_PMCI },
+	{ .type = FME_ID, .feature_id = FME_FEATURE_ID_M10BMC_PMCI },
 	{ }
 };
 MODULE_DEVICE_TABLE(dfl, m10bmc_pmci_ids);
-- 
2.55.0.11.g153666a7d9bb

