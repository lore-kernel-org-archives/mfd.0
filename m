Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 690F24E77E0
	for <mfd@lists.linux.dev>; Mon, 19 Oct 2026 11:25:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792409163; cv=none; b=BbyLJBfMTykUvM7v4NV5rMGuU5eiPxRauNH+7e0ofP1nDvW6boJ3XBA3lF9j7YLKpGmt+uvpjMeOU/UjU1iEq63M0tvElY4vJIeiWcecGPuUfZi1s+Uyy4hUARLzueLailzCMKKVWbm6qPunNkS3EwlhgliVhwk7X7agSefLlRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792409163; c=relaxed/simple;
	bh=3nXXqhpzf8K/+hXUe7l+H8MG2OcKbb9smch8ETujRsw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RLro6SlxgtM49tzQ0ayBArWvOB4zHpN1n8oe9Le930W3wNydF9uWle/Fi9lZSbo0yD1NACwGNgmIax1LIo0YGzhMyV3TFYUUHiEe0o/kjm4X/awgwSWaRDRpIa2vWuk0+2oMyWVc+2VTmsKTJcbD01NuM6cNaWF/ZJVK+db8WW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UIFem/zo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JedD9mwN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UIFem/zo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JedD9mwN"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J8Otml2752274
	for <mfd@lists.linux.dev>; Mon, 19 Oct 2026 11:25:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6xC4OVordP6iIQiBzMB05d4qBQ+iHW7wsc04Plsjz2A=; b=UIFem/zoWNDHQCPl
	3DA7+TickshegyHDg59S4MZEFkAYyvMUDurzAA42UiqpF3CVDAcFIE2xvTZViT9M
	zjOSA0QE6Cfi/QqZmnkZKU7rn4dtlWxqBFw+lQzFTNxQViCoiaMVGkpmrzqCMPVy
	lScB0WeQLD+wGCNTIo5dx8X3RwleXaDu2NzM9W+uZX4+FAn6QZuNQIyvax2/AZTM
	2N9x9AVPj5IJO2Foclidry4TBDmRBNTNhd2FDQ9JZXvBb9FGH4Q7u/O62nTDEn8x
	q2V6yEKVRyO8jm48HDr+5wfL4IXnC2U2cBvPwfTRxmSyUfxKLYT0peLXpPO7a3uu
	rDgLkA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdf48gt8b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Mon, 19 Oct 2026 11:25:52 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-936aa34873bso398905985a.3
        for <mfd@lists.linux.dev>; Mon, 19 Oct 2026 04:25:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792409152; x=1793013952; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6xC4OVordP6iIQiBzMB05d4qBQ+iHW7wsc04Plsjz2A=;
        b=JedD9mwNYO/Bavo3Mj8EdxBN24vGA/VI4eI46IiFtHeCsuur90zT/Y5NaIUyd6MEPZ
         AWCJbtRViO08J9kexaMQI+BNaA/nxpbR1f8y4aZitmvA5eDnhFSzoeWUvooe4l2JaqQb
         dnS/JxaGLBc2xedjndGjk+eL5PEyoB328oUHyIK2P/blDCSEGeEcIVj8NfRrNyOvuleY
         LT1U2+KULY8S+RVW9nmRMBzKIO1c+6MKlktbHEGCWm+9EHSy3QJgLuoBpBkTa8bCNn7F
         Ncw8cg4/cLe61eguHsj3DZJuzhgsUFQKV2GNebWGacHDfjyw86InuAHGfBPSfv9zfvXv
         cAsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792409152; x=1793013952;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6xC4OVordP6iIQiBzMB05d4qBQ+iHW7wsc04Plsjz2A=;
        b=JxngFofnwzsurpphbvaoaAMRWOoPvkLcFs9UsLIqp6ZMV3lfNhNcU+D1IhM0RkfRVY
         tNXbIHST3/afbUvml9pu89mIPr6nJT1ykiaF2PJ2Pq1W3KHoANWHXi2mFOt6GqWjSIAi
         cQh0rHVJRgltcBxQotP5eRTTkbvtvRm0pBd1Rwqlo7Fl/9FX+gSEYncTszBgFUxKH9Z6
         VHvmfABZGlCsAlNBvRCQgSvSpv2z5oo/PxxtODLIston4sN67met3FHZRwemyQYhOScu
         4Ljx0iG4kYBTiE6ZRbsZThkgLtu4tdk3i0431SNKYNJ+vdSpnCYf16qVXWpSf7xXVMWX
         sbBQ==
X-Forwarded-Encrypted: i=1; AKwUvBz0qR32VjheemaLA2QsxQ9SQPuCcNwjsB5VXgA8In7Fw9nEqHZ3dlZjhpU7JjFEF9Gld0s=@lists.linux.dev
X-Gm-Message-State: AFq9FYJHJuAOoNLDqa5WjUJomv+86jiBMR+uSfoVekbINy3OH2CDPfQv
	zzXg3EtMCF7Z7z1/VrinnwPSHnPPhDwBUp0coOeJ1u9SxLBMvsJgYhigTrL/13+R/69Q2ZwJ7Bo
	TCCMG86dkk/eprPnTOKPUuGe3sSRemBLjwibggfVBQS/xEkY4kfN/n8M=
X-Gm-Gg: AYBFou3XuubP62KKpWPe9s93BIVyhcE8JThMJNmSf4dEZ+7FNkfAaVN/UT0z10D7uau
	yj9cAVOetgvu/IWwRfRuS6jVBqXXSW4ANI4Jk6L7IbrvWYSlUA7ONVzasbMPjA7fGDac9sn1gjG
	WaCTlphB3Z5fxBHWF96npz9SYvrP+RU+/iGUxTaJQ5S6HNkV72QiaCOWXHUvrfBNnjc2iYdA8n5
	9nyREcZF+UKiLqHBTTl+LHOV/dTShnnvD72w3EfHW54qUVCqMu+oimSjY9Qbn+6FWNfszQ/bl1b
	JfR7IVZ9YtBaIGRY5bMrg05FKlCiDnhTDpSJTEkq9ENFhSm52uroB/NYX/Ld0rWigRuu3ZSfYR4
	hNzjZd0Y1WRAONfNhxTQ0/F7Btniha82XkXdob8REJCNPUy3xpyIKCLiVcsBOG/alanFyIcQL4p
	Z7HMZyiQ6od8N6
X-Received: by 2002:a05:620a:4589:b0:939:1222:b9f1 with SMTP id af79cd13be357-93f29a04e12mr1226296985a.0.1792409151670;
        Mon, 19 Oct 2026 04:25:51 -0700 (PDT)
X-Received: by 2002:a05:620a:4589:b0:939:1222:b9f1 with SMTP id af79cd13be357-93f29a04e12mr1226295185a.0.1792409151143;
        Mon, 19 Oct 2026 04:25:51 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ab37ba8851sm12807621fa.22.2026.10.19.04.25.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 04:25:50 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 14:25:37 +0300
Subject: [PATCH v2 1/8] backlight: qcom-wled: fix string detection
 brightness on WLED5
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261019-sm8150-display-card-v2-1-86c05068efc5@oss.qualcomm.com>
References: <20261019-sm8150-display-card-v2-0-86c05068efc5@oss.qualcomm.com>
In-Reply-To: <20261019-sm8150-display-card-v2-0-86c05068efc5@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>,
        Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
        Kiran Gunda <quic_kgunda@quicinc.com>,
        Subbaraman Narayanamurthy <quic_subbaram@quicinc.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, mfd@lists.linux.dev,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4040;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=3nXXqhpzf8K/+hXUe7l+H8MG2OcKbb9smch8ETujRsw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq1f44JBbEvJI7ao/F7pVDoA9QA3FdEnuTWMXG1
 9mEYCtrJkSJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCatX+OAAKCRCLPIo+Aiko
 1eB6B/9XXxaG1spzShZks/wIC8Z0XwqpE6aoNNn8zhK4sg7GP5JCjXeYh/h1U+9QR/GK6j7xTto
 QFOmZ/kLOfZXMqlVlposw0b8AuIu6Z1WOyWcfLDbnl2vxLekiVTxa3V9TRPKm7IbUGzY7j4ansr
 Ru2MOcMUt+lPMfvMHUCOOusAb8sbx7zFrec5PgQf3+TWLmM9jMj/TWFLKhLt6ZMwDcc9jfC2VF+
 VdJ31VYpQxu0SDoP1qGKN26HhsTuujZYrCgkHwkj3oV7N9+g9BzgNuQzkBdMXoQ1Hkpy/PZp9zc
 EjQKQZk2dTjqHc319u+F5r2KaBsXFiNcuAv5fPvLH5GkHDas
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA0NSBTYWx0ZWRfX2JfOlu1tSPDj
 YJ1SUcxi1LzPfFP1dVIBWTpZbY3Afbt8x94t6kYzdYxslYbLLEmIFwzzYm+cKheAZycsbp4yVga
 B8aHXRSVLXfCoEnUEAJcBF3wNsurOtUrGlih5UV91MGM72EZMhPLfjK/NTWhwF6+1C3tV/G23Hw
 LGnO0/dnOW6EHXGnphtDEVEimTu5gPhvDQJzs+pV82e9u8OtgJNMUh2jlFhfx9oxMOzO7oT9WFx
 uhZ6JBjge2EJ8KeCmS9MsLeAXR0w+V3q3Qfg91hOZEiVYXj+PelfUqPCmOFESWfXDTJrwg9eXE9
 54FfzIZM4a05Vx0Wz/Uh7slAox8q2lcBFqk62jWmYzsnL+mglOjzIKtpucL3rzMGllkxxuvJI7Y
 HnZ/eumKmQKDgOKyGkuCzLfmZ2cGGHq+g7LuMEFZUAHD0DMFVf3U+2IN3+MiY9HPaFRQc6UAnLK
 O41+VWa2YKsCPi4aBOA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA0NSBTYWx0ZWRfX3rz1tdcjaVAV
 JT4M0LNq5VTgV8KlcYJJ3m4xEkE2LeV7BIbo7sxG4kmFhhBVXHvk7mnkB5VDFotSqWyGZNna3CI
 itkxiZZGMF94xwwJRNLenQNx0syDAcI=
X-Proofpoint-ORIG-GUID: u114pc_KDC94szTNwZxs00BMSdX_8Ea-
X-Authority-Analysis: v=2.4 cv=Qr/LTlyd c=1 sm=1 tr=0 ts=6ad5fe40 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=GhjHCLKht-b4gqHrCnQA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: u114pc_KDC94szTNwZxs00BMSdX_8Ea-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 impostorscore=0 spamscore=0 adultscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190045

The string detection sets the test brightness through
wled4_set_brightness(). On WLED5 that writes to unrelated registers and
the detection runs with whatever brightness has been programmed before.

Use the per-version callback. A WLED5 brightness write also only takes
effect once the module sync bit is toggled, which so far was done by
wled_update_status() alone. Toggle it in wled5_set_brightness() instead,
so that every caller of the callback gets the new value.

Fixes: 62a1d3f623ac ("backlight: qcom-wled: Add support for WLED5 peripheral that is present on PM8150L PMICs")
Assisted-by: LLM
Reviewed-by: Daniel Thompson (RISCstar) <danielt@kernel.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/video/backlight/qcom-wled.c | 56 ++++++++++++++++---------------------
 1 file changed, 24 insertions(+), 32 deletions(-)

diff --git a/drivers/video/backlight/qcom-wled.c b/drivers/video/backlight/qcom-wled.c
index ca350f320e17..c5243a6d547e 100644
--- a/drivers/video/backlight/qcom-wled.c
+++ b/drivers/video/backlight/qcom-wled.c
@@ -269,6 +269,24 @@ static int wled4_set_brightness(struct wled *wled, u16 brightness)
 	return 0;
 }
 
+static int wled5_mod_sync_toggle(struct wled *wled)
+{
+	int rc;
+	u8 val;
+
+	rc = regmap_update_bits(wled->regmap,
+				wled->sink_addr + WLED5_SINK_REG_MOD_SYNC_BIT,
+				WLED5_SINK_REG_SYNC_MASK, 0);
+	if (rc < 0)
+		return rc;
+
+	val = (wled->cfg.mod_sel == MOD_A) ? WLED5_SINK_REG_SYNC_MOD_A_BIT :
+					     WLED5_SINK_REG_SYNC_MOD_B_BIT;
+	return regmap_update_bits(wled->regmap,
+				  wled->sink_addr + WLED5_SINK_REG_MOD_SYNC_BIT,
+				  WLED5_SINK_REG_SYNC_MASK, val);
+}
+
 static int wled5_set_brightness(struct wled *wled, u16 brightness)
 {
 	int rc, offset;
@@ -287,7 +305,10 @@ static int wled5_set_brightness(struct wled *wled, u16 brightness)
 
 	rc = regmap_bulk_write(wled->regmap, wled->sink_addr + offset,
 			       &v, sizeof(v));
-	return rc;
+	if (rc < 0)
+		return rc;
+
+	return wled5_mod_sync_toggle(wled);
 }
 
 static int wled_read_brightness(struct wled *wled)
@@ -391,24 +412,6 @@ static int wled3_sync_toggle(struct wled *wled)
 	return rc;
 }
 
-static int wled5_mod_sync_toggle(struct wled *wled)
-{
-	int rc;
-	u8 val;
-
-	rc = regmap_update_bits(wled->regmap,
-				wled->sink_addr + WLED5_SINK_REG_MOD_SYNC_BIT,
-				WLED5_SINK_REG_SYNC_MASK, 0);
-	if (rc < 0)
-		return rc;
-
-	val = (wled->cfg.mod_sel == MOD_A) ? WLED5_SINK_REG_SYNC_MOD_A_BIT :
-					     WLED5_SINK_REG_SYNC_MOD_B_BIT;
-	return regmap_update_bits(wled->regmap,
-				  wled->sink_addr + WLED5_SINK_REG_MOD_SYNC_BIT,
-				  WLED5_SINK_REG_SYNC_MASK, val);
-}
-
 static int wled_ovp_fault_status(struct wled *wled, bool *fault_set)
 {
 	int rc;
@@ -494,17 +497,6 @@ static int wled_update_status(struct backlight_device *bl)
 				dev_err(wled->dev, "wled sync failed rc:%d\n", rc);
 				goto unlock_mutex;
 			}
-		} else {
-			/*
-			 * For WLED5 toggling the MOD_SYNC_BIT updates the
-			 * brightness
-			 */
-			rc = wled5_mod_sync_toggle(wled);
-			if (rc < 0) {
-				dev_err(wled->dev, "wled mod sync failed rc:%d\n",
-					rc);
-				goto unlock_mutex;
-			}
 		}
 	}
 
@@ -651,7 +643,7 @@ static void wled_auto_string_detection(struct wled *wled)
 	}
 
 	/* Set low brightness across all sinks */
-	rc = wled4_set_brightness(wled, AUTO_DETECT_BRIGHTNESS);
+	rc = wled->wled_set_brightness(wled, AUTO_DETECT_BRIGHTNESS);
 	if (rc < 0) {
 		dev_err(wled->dev, "Failed to set brightness for auto detection rc=%d\n",
 			rc);
@@ -791,7 +783,7 @@ static void wled_auto_string_detection(struct wled *wled)
 	}
 
 	/* Restore brightness */
-	rc = wled4_set_brightness(wled, wled->brightness);
+	rc = wled->wled_set_brightness(wled, wled->brightness);
 	if (rc < 0) {
 		dev_err(wled->dev, "Failed to set brightness after auto detection rc=%d\n",
 			rc);

-- 
2.47.3

