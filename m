Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3323A4570FA;
	Tue,  1 Sep 2026 20:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788292970; cv=none; b=m6gwG7UzxvGGsbNZmlZ4d3NG/yset1m2zKPRFqsJsFqNlI22G1kO3r43vcFmXDHHhOXL6Lac9Qf1QTkFLoudcFXwN8Q26GiH28+ejlPUCIppjPiqzezf5qXsKPJgKCBnevoU84AS9qt2eYj6BF9J/VEK1qNNCwa74QdtRySUV8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788292970; c=relaxed/simple;
	bh=R3jxbGkgGfOX4rp8Evxp0ZbJMbQnQCwHgRqRn6sEKTs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bTyBMkvV2WCgl/PAZByKyDZGhoqmMbPXs51HR3vNXX+IXliDdXE6x46LwGvWfp5pDStZY7Q/u0w3pK7Yau5aywVW1K2NuLLoVIrsBfeNtw6uKjy3ZPf+asRKwbSR17nv4C9GO6roKGiNcggF4cyE5vVdnrI2m1BWGPjM5tJWek4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PST3li2q; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PST3li2q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8E211F00A3E;
	Tue,  1 Sep 2026 20:02:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788292961;
	bh=YmJceeDBdhPEgVm3BODfgB8lKWRTXnpjxh7sCmUtsWM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=PST3li2qknCUbUUca7dE20767hZKVUuDiKheG1iYUPn3a3hr5TDI6L1qLznJbLaCs
	 SigucAkeIEshTInOfLI36u1fpI550ZJFFLazEpfWIGoGJrdlALw0Quk3DEcsBWtJq/
	 b5Yg4wUAB4B8yzN3H6z0K2l9IrqAFOZtzeW+zetUQhpsOe2RgIaRsGeEe0jyFDT+A1
	 Du5Z8eVAb5vnrv/Gdm4nDe/LpmuU408W9AVkVZMhuQBgDU04Pyw6jdXO+HhGqx/Pvj
	 geDJB+NjnT9td++5nas6BTFK+JbEZdHHgLLSa80RRTU00Sy0etWuG7/suyCfMWXyZp
	 n9HYQ515kqKJw==
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 01 Sep 2026 22:02:16 +0200
Subject: [PATCH v2 11/13] regulator: ab8500: Use scoped guard for shared
 mode mutex
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260901-ux500-dts-snowball-regulator-v2-11-fe88b01829bf@kernel.org>
References: <20260901-ux500-dts-snowball-regulator-v2-0-fe88b01829bf@kernel.org>
In-Reply-To: <20260901-ux500-dts-snowball-regulator-v2-0-fe88b01829bf@kernel.org>
To: Stephan Gerhold <stephan@gerhold.net>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Axel Lin <axel.lin@ingics.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>
Cc: devicetree@vger.kernel.org, mfd@lists.linux.dev, 
 Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.14.3

Use a scoped mutex guard in ab8500_regulator_set_mode().

Assisted-by: LLM
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 drivers/regulator/ab8500.c | 23 ++++++++---------------
 1 file changed, 8 insertions(+), 15 deletions(-)

diff --git a/drivers/regulator/ab8500.c b/drivers/regulator/ab8500.c
index 57ef3d4610e6..3c1962ad85d4 100644
--- a/drivers/regulator/ab8500.c
+++ b/drivers/regulator/ab8500.c
@@ -20,6 +20,7 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/err.h>
+#include <linux/mutex.h>
 #include <linux/platform_device.h>
 #include <linux/mfd/abx500.h>
 #include <linux/mfd/abx500/ab8500.h>
@@ -542,6 +543,8 @@ static int ab8500_regulator_set_mode(struct regulator_dev *rdev,
 		return -EINVAL;
 	}
 
+	guard(mutex)(&shared_mode_mutex);
+
 	if (info->mode_mask) {
 		bank = info->mode_bank;
 		reg = info->mode_reg;
@@ -552,9 +555,6 @@ static int ab8500_regulator_set_mode(struct regulator_dev *rdev,
 		mask = info->update_mask;
 	}
 
-	if (info->shared_mode)
-		mutex_lock(&shared_mode_mutex);
-
 	switch (mode) {
 	case REGULATOR_MODE_NORMAL:
 		if (info->shared_mode)
@@ -573,7 +573,7 @@ static int ab8500_regulator_set_mode(struct regulator_dev *rdev,
 			if (!shared_regulator->shared_mode->lp_mode_req) {
 				/* Other regulator prevent LP mode */
 				info->shared_mode->lp_mode_req = true;
-				goto out_unlock;
+				return 0;
 			}
 
 			lp_mode_req = true;
@@ -585,18 +585,15 @@ static int ab8500_regulator_set_mode(struct regulator_dev *rdev,
 			val = info->update_val_idle;
 		break;
 	default:
-		ret = -EINVAL;
-		goto out_unlock;
+		return -EINVAL;
 	}
 
 	if (info->mode_mask) {
 		enabled = 1;
 	} else {
 		enabled = ab8500_regulator_is_enabled(rdev);
-		if (enabled < 0) {
-			ret = enabled;
-			goto out_unlock;
-		}
+		if (enabled < 0)
+			return enabled;
 	}
 
 	if (enabled) {
@@ -605,7 +602,7 @@ static int ab8500_regulator_set_mode(struct regulator_dev *rdev,
 		if (ret < 0) {
 			dev_err(rdev_get_dev(rdev),
 				"couldn't set regulator mode\n");
-			goto out_unlock;
+			return ret;
 		}
 
 		dev_vdbg(rdev_get_dev(rdev),
@@ -621,10 +618,6 @@ static int ab8500_regulator_set_mode(struct regulator_dev *rdev,
 	if (info->shared_mode)
 		info->shared_mode->lp_mode_req = lp_mode_req;
 
-out_unlock:
-	if (info->shared_mode)
-		mutex_unlock(&shared_mode_mutex);
-
 	return ret;
 }
 

-- 
2.55.0

