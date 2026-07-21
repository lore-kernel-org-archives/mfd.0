Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1BD3415F22
	for <mfd@lists.linux.dev>; Tue, 21 Jul 2026 18:01:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784656902; cv=none; b=HDMyn6FSkxzU47fzf2S37vXitgNdrkK7bAgU+Bwhv5iKl7op6CJlZgN5eUcpAWmNmu2SMut/yGH4V4qfJj/SmMh6ynfwF2luphMG/PC8UlrlC5bLl2tUzdWUboKEqDgUu4AEZaLLUbqdBnqfw0qwoXsoKi7qT7mJcPSMFbpgvg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784656902; c=relaxed/simple;
	bh=aqq0bZT/hXwWx8UmLFddb1dgw0fuBz0WtdUMce/GDRc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o4NISxeLqQ5U4A464fwamOwBIjmm/M/l6Z8a079h0gyh1YHnQ7iFlnGAVD5rKVlBz//BbukWXJN3B8pP/g2KQSkjhInE1wFv4CoGnYV/ungqvzn5rtqu0f92LJSFcjWXEn0LyfoRIYH7yELnDWzDIlghhjqSHlWdyL/Xv2pl7io=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mLQXOczG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cI704gd2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mLQXOczG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cI704gd2"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LH2Uk43439782
	for <mfd@lists.linux.dev>; Tue, 21 Jul 2026 18:01:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/6k5png2EebTSIaZVxRWm8CM
	pbRPFtbdYVyNuYkr3Bc=; b=mLQXOczGSWLql6CaoiBRiSt2MSd/PEkDyEOCPiO9
	Qi2BBfj7JoMKyL6h7LFo2V3JMxJQTywe2i1oTTKpzKC9q3Hz0Njq4d7bboprE6CC
	iWSW2bW74uDvso864zQ938lON6ywA1pYuTMVm+IFAkpOCmlACRB9zQr5GOBmYv5x
	ZHwK8NP5yC53S4a5Rh3FROK/zOlBOd+7aG9uvZUGdN5id6Fg2J4uf/UObCKn02uS
	MYcrAKzMTPI6qrUhjWk8Bzwd/Hv+HHbJZS93p75EG9f9+0fwl5H7ytjhh55AXjQU
	M1MKKRM4Pa+Bf38JL7Z/TsQk/dh9Z5EsdNXwda7M7jaDyQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj6nstb21-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Tue, 21 Jul 2026 18:01:39 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cc640dfde3so95506475ad.1
        for <mfd@lists.linux.dev>; Tue, 21 Jul 2026 11:01:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784656899; x=1785261699; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/6k5png2EebTSIaZVxRWm8CMpbRPFtbdYVyNuYkr3Bc=;
        b=cI704gd2Lp+qud3jN7Tb5rRDGoWqFoaUqiaG1WkyArZMCR2d+VvIAm1/mxgD5OqKo3
         sA1D9Pkc5YEY5I5MtYyDRssRTGpDRH52R5XfTvxPP4JeF6A9xwgIh6ymZOcxT11AyyyJ
         OO1TnwQvZyfMbGhaBhKV4VgZUVFoouVDirZVrnMlGWYermHluSh/j9Z8oXp/2NuIvEvs
         ut2Ne1BUSuoDXSapOQZP3dwQviPKG/djZpa9GwZIWHmt6w6KRh4jmDbJcbzgpc5shltF
         4Cnhu2Jm2AgQ0xjM7rb6kkbtaLi+BtaJU0G4lzGcBIVEig0QrivR25p1bUDRs+/KBrFp
         KSwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784656899; x=1785261699;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/6k5png2EebTSIaZVxRWm8CMpbRPFtbdYVyNuYkr3Bc=;
        b=RhQ+aagDwIvcVX3pezpkVIkzCvydvTWRJwuTDoAJf+DeuYVyP15DECKSu5mknLI1oh
         Z/Tbl309l35ZnjG1My8M6mDuhHRlzwzrlbF1zs4gTZubzBRa9mooRTxstc5YTie1+YUR
         5zbVgvEpNiJMQDfEh/mAoV1dymfGm+JimQi41642Gdk1Dm3of7bFcY6L4nkrLgOmq5rp
         CLloZVatV8b85YchL3Yr9tydpb8sMFSJhN8F5IPac/biN9/AmRWyX62iY0qIp2ZpJAVB
         jhvkDkiCsXhCGy9YY4W1XKM7wtAKzV3O8HTfXMRgiNQkBUJUxNq9H18Ej1qz//nmeWE3
         YMdg==
X-Forwarded-Encrypted: i=1; AHgh+Rr/Fx7ErKoU7kmP/xJ3goHp8tYNyABxFB9g+n/Lv00UTmYnes2vtXmQDwrL9aVWPPQaBNU=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx7EQAL3oJKmOOKdMIOttTBR4/cw1wHWkKUnf146O8GsxT+0uh4
	rFsMNtSGtL0WqdEoye32rO43r6P4ADMfLzYcbVYBlyeyXJUVS10v8QDI6WWs66YZQHcyudJUELh
	njBFKwFM5RRcBvygGb0ZzrKZth5j/m3MBv4x8oGnYMp9m+g7rA9kRfIM=
X-Gm-Gg: AR+sD13ftFjlG41zvYJy6z1FBr+PypjG0Bch84/JTxaSEkGwIew1USB9nyK4gVy+tP2
	bMX3le9Cnr15i91TKqg+iCYjTQHUsPlKV8kC4Jacmiz8aJ8bGrolFTxeVDIPZV11ZyZmsDBgY5n
	Np4NsNhcmD4ubNkwI+4qToG+VYje1+Q/3N7exWAmw3cJG4r/sUcVpErEtz9uCxVIfMkOa0cbk4J
	2NIKMxon+tkTgCb7lT4uG6blyrAHz/yaDHr6ZMuzgHMKHa5+bTe77VmVUqto0Zv9AVaniuSsqvt
	ol1ZB9xCQy/5k1EolA3JiVEr5LaUwrQop7Y1teAW+NuPofgT+E2X3/NLdLPpgpgpWYgWVMrddTt
	6lRsKvuH7+KKRgvGIljkgubvnXWqoak5NXA==
X-Received: by 2002:a17:903:15cf:b0:2ca:be8:62d with SMTP id d9443c01a7336-2cf349b5923mr205347255ad.32.1784656897470;
        Tue, 21 Jul 2026 11:01:37 -0700 (PDT)
X-Received: by 2002:a17:903:15cf:b0:2ca:be8:62d with SMTP id d9443c01a7336-2cf349b5923mr205346725ad.32.1784656896901;
        Tue, 21 Jul 2026 11:01:36 -0700 (PDT)
Received: from hu-pkondeti-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147dc61637sm1021861eec.8.2026.07.21.11.01.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 11:01:35 -0700 (PDT)
Date: Tue, 21 Jul 2026 23:30:59 +0530
From: Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>
To: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Cc: Sebastian Reichel <sre@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Ulf Hansson <ulfh@kernel.org>, Lee Jones <lee@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Andy Yan <andy.yan@rock-chips.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        John Stultz <john.stultz@linaro.org>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Sudeep Holla <sudeep.holla@kernel.org>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        mfd@lists.linux.dev, Srinivas Kandagatla <srini@kernel.org>,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH v23 01/13] power: reset: reboot-mode: Remove devres based
 allocations
Message-ID: <ac030bd2-6b14-4b55-b277-422514da5f32@quicinc.com>
References: <20260714-arm-psci-system_reset2-vendor-reboots-v23-0-e7453c548c21@oss.qualcomm.com>
 <20260714-arm-psci-system_reset2-vendor-reboots-v23-1-e7453c548c21@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260714-arm-psci-system_reset2-vendor-reboots-v23-1-e7453c548c21@oss.qualcomm.com>
X-Proofpoint-GUID: YMUJlfsh-idSodkPGveMI7h72znU11xm
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDE5MCBTYWx0ZWRfX/0+6vf3TKiUo
 QdJXdhiD9sQvUPvuKKNvKoBSuopCiSg6Irw2QogMBcnpa+C9OY0ylmK1GYtviS+GTw1g0q+/lfi
 uyms7F2ABJYeBPUb+rJlgDpCYRI7A60=
X-Authority-Analysis: v=2.4 cv=ZJjnX37b c=1 sm=1 tr=0 ts=6a5fb403 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=QX4gbG5DAAAA:8 a=EUspDBNiAAAA:8 a=GxRVn01Nmxo37F9Fo38A:9 a=CjuIK1q_8ugA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-ORIG-GUID: YMUJlfsh-idSodkPGveMI7h72znU11xm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDE5MCBTYWx0ZWRfX4DOlFNxVMocv
 3Qu1tjS0E+YTwYu33sV1IChgJ3jpWpHIJ/JDw0+y5YutJIc4hEmaVgm4X5d4V8Xh1YqcvU2rVKX
 lKTJ+LnE2tUP8IwIFUg13/BL7TXbuKxi1ODxiSUU1RSTRGxshPCoNGa4KS2wSKkx92fILtTOWG7
 bOpLtGZ/OnHXe6PKWXvhexD+TLlVaWpFCmJYN38HbtpsvVrjaL1mLuOQzGtNSIz/2sGHJwmVT3t
 /SUaKa1qhGm6gnJ+AQ7R3p1VOfN8q+7ZZ1mIXjkG3HHAcc/gz6NYiRQqp3fCYCBvGpV159dN3+X
 NfvmZq6rBg/EhekIs2Yi3IwD6+D1nKiUCfPHn2fbXCuBmxNIbRwA5KcS3phqjZMWXM4voWQxkk/
 ++WFVWyhoXXnSS1AiKvCwC8YylgvMgHjkC8lOV9zUw3bNIx1n6FMEsktiQjs14jnl/2K12d95hm
 +yXYryhrFWAfv/QQH4g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_03,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 phishscore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210190

On Tue, Jul 14, 2026 at 10:46:29PM +0530, Shivendra Pratap wrote:
> Devres APIs are intended for use in drivers, where the managed lifetime
> of resources is tied directly to the driver attach/detach cycle. In
> shared subsystem code, there is no guarantee that the subsystem
> functions will only be called after a driver has been attached, nor that

You mentioned driver may not be attached.

reboot_mode_register()->reboot_mode_create_device() is using
`reboot->dev->driver->name` directly for creating the reboot class
device? 

> they will not be referenced after the managed resources have been
> released during driver detach.
> 
> To ensure correct lifetime handling, avoid using devres-based
> allocations in the reboot-mode and explicitly handle allocation and
> cleanup of resources.
> 
> Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
> ---
>  drivers/power/reset/reboot-mode.c | 32 ++++++++++++++++++++------------
>  1 file changed, 20 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/power/reset/reboot-mode.c b/drivers/power/reset/reboot-mode.c
> index d20e44db0532..7a74f72a8313 100644
> --- a/drivers/power/reset/reboot-mode.c
> +++ b/drivers/power/reset/reboot-mode.c
> @@ -3,6 +3,8 @@
>   * Copyright (c) 2016, Fuzhou Rockchip Electronics Co., Ltd
>   */
>  
> +#define pr_fmt(fmt)	"reboot-mode: " fmt
> +
>  #include <linux/device.h>
>  #include <linux/err.h>
>  #include <linux/init.h>
> @@ -10,6 +12,7 @@
>  #include <linux/list.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
> +#include <linux/property.h>
>  #include <linux/reboot.h>
>  #include <linux/reboot-mode.h>
>  #include <linux/slab.h>
> @@ -168,10 +171,11 @@ static int reboot_mode_create_device(struct reboot_mode_driver *reboot)
>   */
>  int reboot_mode_register(struct reboot_mode_driver *reboot)
>  {
> -	struct mode_info *info;
> +	struct mode_info *info = NULL;
>  	struct property *prop;
>  	struct device_node *np = reboot->dev->of_node;
>  	size_t len = strlen(PREFIX);
> +	u32 magic;
>  	int ret;
>  
>  	INIT_LIST_HEAD(&reboot->head);
> @@ -180,19 +184,18 @@ int reboot_mode_register(struct reboot_mode_driver *reboot)
>  		if (strncmp(prop->name, PREFIX, len))
>  			continue;
>  
> -		info = devm_kzalloc(reboot->dev, sizeof(*info), GFP_KERNEL);
> +		if (device_property_read_u32(reboot->dev, prop->name, &magic)) {
> +			pr_debug("reboot mode %s without magic number\n", prop->name);

Any reason for converting dev_xxx to pr_xxx here and below?

> +			continue;
> +		}
> +
> +		info = kzalloc(sizeof(*info), GFP_KERNEL);

The recent commits to this driver adopted kzalloc_obj().

Thanks,
Pavan
