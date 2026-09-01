Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D9F545D1BD;
	Tue,  1 Sep 2026 20:02:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788292956; cv=none; b=cB/rHJzAdmNQgXb2IJGdlHc+y3E4yG+e3Ux/GMBZydVRLuCrUR5g9AZhmVMgMWVgeIrOYIxqR+JITTAfj98+WoN7kL8P1Q6pAoJxrcQWKVb0UOTwOxPXaXoXfTv/2E/Ruv4cKDQVMrNFb+subTZPi6Q5CgTTgEDFjB4CW23B4mk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788292956; c=relaxed/simple;
	bh=Dv/QiirNXaEGGNxNMEdOvs71nxTnxu7bZFGiiKUplfk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=D0XHVWav8EjQAw7O5+0plLt/KktGZo6IE117JNBGAQix6r4z4WJLP0jFoJFaH/uJVNAngDP7B5UefjVkOlWi8+qFaaQ+sDSq4pjcaDk6eQ3vy+2Ax122Q9Dmeju02YqhXbXlODUWDpjzjoSH3AO272kbM36DXVfUwVVlbucUrxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FjpkA48E; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FjpkA48E"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8105E1F00A3F;
	Tue,  1 Sep 2026 20:02:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788292947;
	bh=bMZt0GB7fomwJcSjpqK2GXhF/LZOwUajUGEkniPFZLE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=FjpkA48EzMYE472+3+HsMmxZLIM17d0a6NG1vhgNklhotIwq9qS5bYzrPpuno/A0N
	 na3sWbvmEFC4s+0w06TU9Vj3VwbvO+zS3klJT674vrNW9zUmhKguxeF6hJidkvUyGE
	 15S3wAUhn7Q5gYanfleT4+pK4hlNTPW1CYmtCoGd+fq1LBhaYQwFd4prFU4MXFXxlY
	 HOGtm59t4WmA/vU1FdACSTejfiqca1pAvu64S31j3zPIWPeLlY4ZbuMg6VHMfTUHyf
	 ehk7raLeCcRybPQzgk902H5m8GzZL/OcbbdA9xiCsv+N/PEcwFFoZS3A6uPn72bimz
	 eRrzwVJ5WIOYg==
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 01 Sep 2026 22:02:11 +0200
Subject: [PATCH v2 06/13] regulator: ab8500: Propagate mode enable read
 errors
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260901-ux500-dts-snowball-regulator-v2-6-fe88b01829bf@kernel.org>
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

For regulators whose enable and mode share a state field, set_mode()
first reads that field so changing the requested mode does not enable a
disabled rail. A register read error is currently treated as true and
the driver proceeds to write the new mode, potentially enabling a rail
whose state is unknown.

Return the read error without changing the register or cached mode.

References: AB8500 User Manual, UM0836 Rev 3, p. 227;
AB8505 User Manual, DM00046744 Rev 3, p. 237

Fixes: 438e695b87e0 ("regulator: ab8500: Get rid of is_enabled from struct ab8500_regulator_info")
Assisted-by: LLM
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 drivers/regulator/ab8500.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/regulator/ab8500.c b/drivers/regulator/ab8500.c
index 05c6b9c7af0c..e4c3502c8dbc 100644
--- a/drivers/regulator/ab8500.c
+++ b/drivers/regulator/ab8500.c
@@ -433,7 +433,7 @@ static unsigned int ab8500_regulator_get_optimum_mode(
 static int ab8500_regulator_set_mode(struct regulator_dev *rdev,
 				     unsigned int mode)
 {
-	int ret = 0;
+	int enabled, ret = 0;
 	u8 bank, reg, mask, val;
 	bool lp_mode_req = false;
 	struct ab8500_regulator_info *info = rdev_get_drvdata(rdev);
@@ -490,7 +490,17 @@ static int ab8500_regulator_set_mode(struct regulator_dev *rdev,
 		goto out_unlock;
 	}
 
-	if (info->mode_mask || ab8500_regulator_is_enabled(rdev)) {
+	if (info->mode_mask) {
+		enabled = 1;
+	} else {
+		enabled = ab8500_regulator_is_enabled(rdev);
+		if (enabled < 0) {
+			ret = enabled;
+			goto out_unlock;
+		}
+	}
+
+	if (enabled) {
 		ret = abx500_mask_and_set_register_interruptible(info->dev,
 			bank, reg, mask, val);
 		if (ret < 0) {

-- 
2.55.0

