Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE3D21ABEDE
	for <mfd@lists.linux.dev>; Sun,  6 Sep 2026 11:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788693615; cv=none; b=BtfHWsTwMlpsIU8K8wzcwaoj/SK+tGtsd3kmN12olFrTamCQaWnwacr/LSGIfQQE7YSxRtTcdSLRqvkpTzWBG6Ll4LR+RzAhT+UUOlmb/3avdeJ3ZrKeXl7nP26BQdTE7THBYH3YjP194YjiEgmptS+mjbsaFxd8FCbF3GLkX1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788693615; c=relaxed/simple;
	bh=jLuV+lLqQK8/EHcVuPKgeyCNnuLNb1rLsMWCYlCW1hI=;
	h=Message-ID:MIME-Version:From:To:Cc:Date:Subject:Content-Type; b=dCFTKYcLQD4jifsQfqkHXcQNF7f/GpOabhbwlOb5Prf/oyYv8cP9HnaZzX+A2kihK5sLeKkgKbWaKXe4XIjP3MaiwYB/+/TeMZYncXEAE7frPcBrifVe5xfQiHJC0b+iosB2Rp82qDwSCdtW19CJY0NuTpEMZI2dzTLLEEJK4P8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lDN52j4o; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lDN52j4o"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2d6e954afbdso15957605ad.2
        for <mfd@lists.linux.dev>; Sun, 06 Sep 2026 04:20:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788693612; x=1789298412; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:subject:date:cc:to:from
         :mime-version:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PTH7GUXLcuozQUUFEaYKkQ5+81ENlZ2w0hwg8hOzpBI=;
        b=lDN52j4oihreGcCulJWj3ImctkpUbj2qOb+tGs7Ob3dg22NLvXM1yo+mAYCM9EwoCR
         C+SvJbC2Z7p2/yKwnRL0YC9emBQVVSpls72Ak1pQjs2Xy6eQviuDT++47s6jR126gjc6
         YduiyTVYn5109PpLcpWJtdpmhFMCuQ2UTj+3uonfg9ioD1nbmsoJdwmBq+AwqBwMEI4W
         hdC+mYRXg9nBD36oe1BKVxCQk3ovG6PHfHwLX3SiU2I0nS8kqgV+tq0qJrv4/NlW7GT9
         wLHZ+S4fUYg4M7z9/Kcb7DB2tOmEPCO03H7qZr9X9EubC5MGWIk1eLUUdhl2un11Zi8/
         ksAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788693612; x=1789298412;
        h=content-transfer-encoding:content-type:subject:date:cc:to:from
         :mime-version:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=PTH7GUXLcuozQUUFEaYKkQ5+81ENlZ2w0hwg8hOzpBI=;
        b=KU9qq1pUabwfyYdqkiWsaMnqNDCUUF+DCGYJliHPk3YJWphmBPahfeu26qyGB06WgS
         fFVlrDCOkYuB1GzxkSaWa3cgFxXDx1aOJ0Bm7oR3im1G32Lki9X+KqhDwdJWjHLhXcXU
         oSqU659Ye0buqCtFVScKne8hQmIE7LajS+rtkH9DFfjVvLIuwAxGZk/jJmBy914LjXNX
         kLef+J0OJYhEqVez7dzkkzSk/XmV2Q5IiBiovrU3AwmXnR+V9bPsYjzlycmvOGIjM3Dv
         /RyNCoE5ZClq4KnrO+9cfDZqI71ZuiST305ze5ZKu0SJ2YqZUNyfPRv7X8B5hES5HFny
         IQbg==
X-Forwarded-Encrypted: i=1; AKwUvBwuUAKCPPSK5x0nfU0mDA2ZfESr5idMjcAuPfuK3Lj5HyWTML+PfBPX9LHrvTDRNFAcAU8=@lists.linux.dev
X-Gm-Message-State: AFuF++mk/Ycc896yiGXlbm++rG9e7uMhUdHBGD9QE8cUHjscdjuPdSye
	mpbbZfROZZEtxfa6cbY0K3WhUuw7GyoMPO63qCMpCfp7sMLcBN17BNjh
X-Gm-Gg: AYBFou3iJSBv5YVQOc1AuPvkw5xuxP+2u2K44jKWooSp5wJlxTng2axGeXhg0zdNri3
	arOIp0RHT531IvRiku2orGP77f9/Ag7SAopdMAHS8hrNx1ydKUw6OQqiN4ZO2F6lXqp83eNcvpV
	mo0nJ1vxQWW0uYbGVVUMIyzZ8b2VoJHJE+YWNEF8biMyQZe5S04vnL8xTFaLVWEvxkLfBl2yG5p
	DrUKQEGUq2yquw+F0spuZ8rF9wYbzhWdfQ0XZ2d1X9MsJG42GyuPtfIU22ZVQrmbRMVkAE8ubYx
	ZITLRzqp54qDOhCUHvqoVrVTKgOXXB3PV6GWxICTDe3wy6EU39iHX1Qm21BkmKIaLx1vRA4yn8t
	FJ9ffFuW1y3tFSlRX2U9enD0oOjK9i4nrTDMzRHpzW0aiBruonrOpvLS/yNG6/3yLfl5u0Taw90
	vnxJFPIoQHQObIUEKN3WK+Ng4p6BU7fM7dQQyybs+2WdgB/PFnTivPMrC+z1izyqZ6XAEoOzS7a
	Jlj0osHXQ5rdiuxN28EiCsrwwMwWIh2pcFrdHPNzQgW4iZkaS3P9vMLbQ==
X-Received: by 2002:a17:903:11c8:b0:2d8:d4de:fa80 with SMTP id d9443c01a7336-2db1235721dmr234116345ad.4.1788693611959;
        Sun, 06 Sep 2026 04:20:11 -0700 (PDT)
Received: from manush ([2406:7400:94:7a79:f149:be84:942d:9300])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339aa36b37sm19291515eec.14.2026.09.06.04.20.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 04:20:11 -0700 (PDT)
Message-ID: <6a9d4c6b.79b5ea6e.147aa1.5883@mx.google.com>
X-Mailer: git-send-email 2.46.2.windows.1
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: "Manush Prajwal" <manushprajwal555@gmail.com>
To: ukleinek@kernel.org
Cc: lee@kernel.org, linux-pwm@vger.kernel.org, mfd@lists.linux.dev,
 linux-kernel@vger.kernel.org
Date: 6 Sep 2026 16:50:10 +0530
Subject: [PATCH] pwm: lp3943: validate DT output indices in
 lp3943_pwm_parse_dt()
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

The ti,pwm0/ti,pwm1 devicetree properties are raw u32 arrays nami=
ng=0D=0Awhich of the 16 physical LP3943 outputs (0-15, per the do=
cumented=0D=0Abinding and the 16-entry enum lp3943_pwm_output) ea=
ch PWM channel=0D=0Adrives. lp3943_pwm_parse_dt() reads these val=
ues straight from the=0D=0Adevicetree with of_property_read_u32_a=
rray() and stores them in=0D=0Apwm_map->output[] without checking=
 they are actually in range.=0D=0A=0D=0ABoth consumers of pwm_map=
->output[] then use an out-of-range value=0D=0Adirectly as an ind=
ex/bit-offset with no bounds check of their own:=0D=0A=0D=0A - lp=
3943_pwm_request_map() does=0D=0A       test_and_set_bit(offset, =
&lp3943->pin_used)=0D=0A   with offset taken straight from output=
[i], corrupting memory beyond=0D=0A   the single 'unsigned long p=
in_used' field for offset >=3D BITS_PER_LONG.=0D=0A=0D=0A - lp394=
3_pwm_set_mode() does=0D=0A       mux[index].reg / .mask / .shift=
=0D=0A   with index taken straight from output[i], reading past t=
he 16-entry=0D=0A   lp3943_mux_cfg[] array and then issuing a reg=
map write built from=0D=0A   whatever garbage register/mask/shift=
 values were read out of bounds.=0D=0A=0D=0AA devicetree (malform=
ed board file or a loaded overlay) with an=0D=0Aout-of-range ti,p=
wm0/ti,pwm1 value is enough to reach either path;=0D=0Anothing up=
stream of these two functions validates the value.=0D=0A=0D=0AAdd=
 a range check in lp3943_pwm_parse_dt() right after the values ar=
e=0D=0Aread, rejecting the devicetree with -EINVAL before any out=
-of-range=0D=0Avalue can reach pwm_map->output[]. Add the LP3943_=
NUM_OUTPUTS(16)=0D=0Aconstant next to the existing enum it bounds=
, alongside the existing=0D=0ALP3943_NUM_PWMS(2) constant.=0D=0A=0D=0A=
Signed-off-by: Manush Prajwal <manushprajwal555@gmail.com>=0D=0A-=
--=0D=0A drivers/pwm/pwm-lp3943.c   | 7 ++++++-=0D=0A include/lin=
ux/mfd/lp3943.h | 2 ++=0D=0A 2 files changed, 8 insertions(+), 1 =
deletion(-)=0D=0A=0D=0Adiff --git a/drivers/pwm/pwm-lp3943.c b/dr=
ivers/pwm/pwm-lp3943.c=0D=0Aindex 10537e74b..1ce2a1bbc 100644=0D=0A=
--- a/drivers/pwm/pwm-lp3943.c=0D=0A+++ b/drivers/pwm/pwm-lp3943.=
c=0D=0A@@ -218,7 +218,7 @@ static int lp3943_pwm_parse_dt(struct =
device *dev,=0D=0A 	struct lp3943_platform_data *pdata;=0D=0A 	st=
ruct lp3943_pwm_map *pwm_map;=0D=0A 	enum lp3943_pwm_output *outp=
ut;=0D=0A-	int i, err, num_outputs, count =3D 0;=0D=0A+	int i, j,=
 err, num_outputs, count =3D 0;=0D=0A =0D=0A 	if (!node)=0D=0A 		=
return -EINVAL;=0D=0A@@ -247,6 +247,11 @@ static int lp3943_pwm_p=
arse_dt(struct device *dev,=0D=0A 		if (err)=0D=0A 			return err;=
=0D=0A =0D=0A+		for (j =3D 0; j < num_outputs; j++) {=0D=0A+			if=
 (output[j] >=3D LP3943_NUM_OUTPUTS)=0D=0A+				return -EINVAL;=0D=0A=
+		}=0D=0A+=0D=0A 		pwm_map =3D devm_kzalloc(dev, sizeof(*pwm_map=
), GFP_KERNEL);=0D=0A 		if (!pwm_map)=0D=0A 			return -ENOMEM;=0D=0A=
diff --git a/include/linux/mfd/lp3943.h b/include/linux/mfd/lp394=
3.h=0D=0Aindex 5d2d172d3..844938ca7 100644=0D=0A--- a/include/lin=
ux/mfd/lp3943.h=0D=0A+++ b/include/linux/mfd/lp3943.h=0D=0A@@ -53=
,6 +53,8 @@ enum lp3943_pwm_output {=0D=0A 	LP3943_PWM_OUT15,=0D=0A=
 };=0D=0A =0D=0A+#define LP3943_NUM_OUTPUTS		16=0D=0A+=0D=0A /*=0D=0A=
  * struct lp3943_pwm_map=0D=0A  * @output: Output pins which are=
 mapped to each PWM channel=0D=0A-- =0D=0A2.46.2.windows.1=0D=0A

