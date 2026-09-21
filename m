Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E89B4AF9D2
	for <mfd@lists.linux.dev>; Mon, 21 Sep 2026 15:06:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790003213; cv=pass; b=rMf/xDvnNoQWdtEtNnbvDANYDC7zFNri2yt4quH5AKH1/Jgk/zQHw6uANZRAfF6auXkxSPF2CKvM7LcAUaqF+BJSLPdW5pB5d2MKewYgr9WA+NieDK93L1nQYW5Izvkag7NO3OuyE3KMvBPCCNeHi9BIO5ulb61Q+kDpfkb+cVQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790003213; c=relaxed/simple;
	bh=aYncNclNfin+PiSH3ZBkbCnLcwOcf28MAci/gLJCGgI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oBW2AJJ+AQO24DTCAFBWx9ETMEiO2RBnuYrhuSrEH3z/BUOUATXLjFfuEzFs5+7f9jFvsg6yz4f58Fh4SgexektmDsjk0Saer7tf68Nz9AJIJbN9T7LXuHsT4D2cHZXi2yer++bsEJVGT7WfYUHRzJo2NZP001Js6RoUUpTA6v8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KKZhVhQD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ht2JgViq; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KKZhVhQD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ht2JgViq"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LEGdtP763906
	for <mfd@lists.linux.dev>; Mon, 21 Sep 2026 15:06:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bxhyO0Jh4n1ny9hVNE26X7JBrBlVpn6k+kERjy+zw6A=; b=KKZhVhQDb1szOFQa
	Q0LR3oKOw7/zH+3wL7uGLfo7252zbxEQhF34iXoUBY6S6Zw1ktv7arXQbOZ5S+/r
	KCgC+ZA4j5zZf5femY762M5qW6+dt9mIJYmH8DubMkvRdN6QWiRpjBxVV0tNVD8U
	v3BIaJZ5Mu7Qu3yv7fzxy3BDZIFxjycj/G7jHSIYocXLfeEstX1pCLcgpeqGUY1I
	GtZ4e7m6xKhSCi/gS9RVZZ9h7fHVg+2Wgf5T7/YmUzmvi09l7BwHVp/J6cUFozNo
	bS5RYlDZSMCzpehHFeMsaJ7Gck/OmlyWnwauET0VxmQczb5J2DyvXLPrK5Snm3k4
	PtzXdQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu0rj1r7c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Mon, 21 Sep 2026 15:06:42 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-86ab8302b54so3529490b3a.1
        for <mfd@lists.linux.dev>; Mon, 21 Sep 2026 08:06:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790003202; cv=none;
        d=google.com; s=arc-20260327;
        b=ZLe8V9nyGG5LG3IjdNBphDnLCTzRKGRcfrkJmSpWvOygUWcl8mP1ASeDuI8k76pUDk
         /5UGAsHwxZEapRWyGu1+26cFy+gCpehCOKEq/hplPXf+PJdmIzRtEWpqQyNj/1Hbwq9s
         OGj9AgZZM7mszRK9hI+Xq+IRLptkddrvcjxMHGQfFuJUF4qDFB++fHMe2CivP3qVvZkS
         9Fq9whw/zzhHGRdFKHXBmcF4un/D9hEiHiaCTGgf4y88ueybRg40DF1kzwzKUH8pY9Gn
         8B4CMNTOiJaWvAS/rYm19f0sPayoGoDuxflf6JKB3B+/0f9tQhKKHYhyrYSsjaHC+kkP
         UG8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bxhyO0Jh4n1ny9hVNE26X7JBrBlVpn6k+kERjy+zw6A=;
        fh=f0tuibK4MOhDRBxUtVQs05mQHflcpFzQR7W5VThoFLs=;
        b=nY/+34QTOhNIs3Pyw4BnyLvkRlxOiGpfVd27qY45lmwCmcxpQZnsd06V7O5QWpDw1O
         yy+nGL8YWsRp8VMVLdUS2jCRD0CE19eixu9OR9lFzXGJ8zaKy2Gj+vfWMVhQFCbW2BOD
         d64HRwoxQjRWntOUBPAlwjveV8b49/7D9z1F69OL/oFNVAc8c7Qgq57HbYbcKOgu0ci5
         rgRJ6Y0NgYqIWaFxIedTcNnr6kweY0UtB0lNTw9Nxm05U2kH5HyE0scNkg36L80tJbZb
         +VuWo/Ki1I9lA+App6c2ngsPfrRFsC4DOZ/qIT9i+vqxdhNP+ilVEsV4MV2aWQT+mNAd
         WvXw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790003202; x=1790608002; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bxhyO0Jh4n1ny9hVNE26X7JBrBlVpn6k+kERjy+zw6A=;
        b=Ht2JgViq89vFmEJiU440g34coqhErOHwDrL4Y7sTWreV6+Sl7JmVIT4WULtwuE80OG
         nBqcxR6ttjpFZ/ZvGXFSJTGvpcecap4iwKLKi7gpRkS6to6brm8I4CwkXAam4i4v5PYL
         M2ob+zHF1hrlmCkF2UALvtna5HaT04fEsMoDIspDv4Lj5rjZOXnQgEIINuLM2swmBDjM
         ylCWtarW9RwvID6abrGR+/1tkeTrHZGsrezX2LVmen0J8nR3lbvzwqJOfsneAIrd+z9R
         ULU+SjuyfWtC+LPtVcQeKOKwgyJqtwDDYqXVQGjHieuRSxf9tmiRYS7ChMJ92iDheNzs
         ykWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790003202; x=1790608002;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bxhyO0Jh4n1ny9hVNE26X7JBrBlVpn6k+kERjy+zw6A=;
        b=bT9GS5zKa9euzzt2gjxU2T1aoD5c3NL9UxHrxZ3NQHJ2BdpdJH3NxibaOkwt3553cb
         9giNKn4khW82xzrEiIW0kx3ztujmeRjV0Pkaxw2+QheFjcV5zJQeuu6+npK+o+onJM7W
         Y/G959E+f50acTrzNscjjq3yItraRPlGnnQ9eMCpkpKmE3bSjS0a7jBznZfQR8sZ0L9d
         a9/RJvJ6PByLgQncBP0V0S+71dsX63kZvla5MSE+mMg2M8AlHXCTlleJFQAatlpWmP8j
         4mYBHS+hmGdkfgg5ytRiXAYZY7AaqyoKYfYAOQT0lyYPHrAlXBMecwbIl0KAFonNqtb6
         EbiA==
X-Forwarded-Encrypted: i=1; AKwUvBz1rDXBpBppmS5IPpQFHHrb9TVTlCi6fzIPs3edrMHH6N9xEeaMhlzbo7DRjd6ZtuBYSPE=@lists.linux.dev
X-Gm-Message-State: AFuF++m+1a9xhVzgR/fgw/kt9v3t1A5NU1N5FyhWQpqOl/3Yrm+ombTw
	roby6A3D/iUjSFao/acDNm+w61jQuHfCGf0RzoYfP0z0YFmUIJe98xaS/+CGwp0Td2tS/k/EIWU
	jGxdiLDDJ33bzGe0+h3AGDqgUMUC09jUWVylitMP2Z8c2tgWL8Nrt+ZZ3XB95EhjNHnsxOnFMfp
	2c0MszJ8H1L0yT6N3LfKhdtdmwB5szdQ==
X-Gm-Gg: AYBFou1ayR02RDmuM2uUFMqZYkeWEiMvslujeEpVryKcmi8pUEShULEq1edXWBGjVWo
	UdsSv6lWuCjKC6j2gAFK6FhAtPwnVOKjuQW67KJtaANMFm32eQVc0HT7U2Gjq5qvMtXuBEDnOh8
	Ty1QJcSRbtlmOq5YVvxq2oics9y0lhFP5681+lgTinj6DN0L4Cc84xGZU3KA==
X-Received: by 2002:a05:6a21:b89:b0:3dd:a008:dc38 with SMTP id adf61e73a8af0-3dda008e117mr10971971637.38.1790003201607;
        Mon, 21 Sep 2026 08:06:41 -0700 (PDT)
X-Received: by 2002:a05:6a21:b89:b0:3dd:a008:dc38 with SMTP id
 adf61e73a8af0-3dda008e117mr10971909637.38.1790003201121; Mon, 21 Sep 2026
 08:06:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260914-arm-psci-system_reset2-vendor-reboots-v25-0-4aaf5c09b5c2@oss.qualcomm.com>
 <20260914-arm-psci-system_reset2-vendor-reboots-v25-4-4aaf5c09b5c2@oss.qualcomm.com>
In-Reply-To: <20260914-arm-psci-system_reset2-vendor-reboots-v25-4-4aaf5c09b5c2@oss.qualcomm.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 17:06:29 +0200
X-Gm-Features: AcwNN1X_O2duJZUWs00J06LHNYx2Zq6xdcFB3ybS_8tk_DldgmJDaIQAUL-sBHw
Message-ID: <CAPx+jO_tDttD8+XpRjG6E+XyQa=-_v-Gr=2Unc+6OSBJ2P7Oqw@mail.gmail.com>
Subject: Re: [PATCH v25 04/10] firmware: psci: Add support for PSCI auxiliary devices
To: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Andy Yan <andy.yan@rock-chips.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        John Stultz <john.stultz@linaro.org>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Lee Jones <lee@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Sudeep Holla <sudeep.holla@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, mfd@lists.linux.dev,
        Srinivas Kandagatla <srini@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDIyMCBTYWx0ZWRfX5WbyefmEyM9v
 SmDeOhT55FmM1iRdqKJbjY+um0gItn8L1v5NdKAS1MX1CElyYKoTiDNVAwGPGZ4XUbMxv1MjCFe
 RmQsp0XQVzfkhpx2nbD5kEoB8obrpMg=
X-Authority-Analysis: v=2.4 cv=AsR7T+9P c=1 sm=1 tr=0 ts=6ab14802 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=JfrnYn6hAAAA:8
 a=R4g-3rje7_dzknkHWHoA:9 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-GUID: SyNRyOyiKZ8DO2unJn-VD2WqtLoZH3u7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDIyMCBTYWx0ZWRfX+yXOrdgeYwle
 Gf3LIGvxIF6tedMnHq6RitFsLeyBic3ytfZX3FXJgH+boj7sQwxHnAiXWvAVULYVNYB/zY4fWaS
 u2Nvd/J8OCzY1Tj/QequxhfcQ6q969YwVhkQySOiwmzqn7fqg+zolReA7FyWtIkKSO+HCRRQXiT
 y83xfsifuzVGbnUKXYT4A1Vssc6bWgXeyIGjVXGIXmLl9B0nwhoLseTqFX3Zj4rUuvzGM+4SOTX
 t9Me5OUnorHP+j0Jhug/WjbCP2m4s1+XbIrYsvaJ5CU4CXUkC1XfmpW1L/Bijvv4X+9XoXv0+jA
 xNth1Ynwd3DQIXC+eekErwkw8RdXWX3HtWDFEXizWAUU+Mg8rDC5H2bUurTHA0rYs9LAtCOaGTo
 db0F8CRMEMsPjtNa9Vmxkch5CuESwxik+RUa8d1kfYQJ7FMTSHaZs39gLGORC9eiQ/AG1vaBITU
 Wegn5fgld6+8vNlZvuQ==
X-Proofpoint-ORIG-GUID: SyNRyOyiKZ8DO2unJn-VD2WqtLoZH3u7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 impostorscore=0 adultscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210220

On Mon, Sep 14, 2026 at 5:00=E2=80=AFPM Shivendra Pratap
<shivendra.pratap@oss.qualcomm.com> wrote:
>
> PSCI has multiple kernel consumers, such as cpuidle-psci-domain.
> Currently, both the PSCI core driver and cpuidle-psci-domain bind
> directly to the same PSCI node "arm,psci-1.0". Additional consumers, if
> introduced, would also need to bind in the same way, leading to multiple
> drivers attached to a single device node.
>
> Introduce a PSCI auxiliary-device provider that binds to "arm,psci-1.0"
> and registers PSCI child devices on the auxiliary bus. As the first
> user, register cpuidle-psci-domain as an auxiliary device.
>
> Update cpuidle-psci-domain to probe as an auxiliary driver and use
> the PSCI device node for power-domain traversal.
>
> Suggested-by: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
> Suggested-by: Lee Jones <lee@kernel.org>
> Suggested-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
> ---
>  MAINTAINERS                           |  1 +
>  drivers/cpuidle/Kconfig.arm           |  1 +
>  drivers/cpuidle/cpuidle-psci-domain.c | 31 +++++++++++++++-----------
>  drivers/firmware/psci/Kconfig         | 14 ++++++++++++
>  drivers/firmware/psci/Makefile        |  1 +
>  drivers/firmware/psci/psci-devices.c  | 41 +++++++++++++++++++++++++++++=
++++++
>  6 files changed, 76 insertions(+), 13 deletions(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 207a6e2db70c..9c0334ee2ed2 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -21932,6 +21932,7 @@ L:      linux-arm-kernel@lists.infradead.org (mod=
erated for non-subscribers)
>  S:     Maintained
>  F:     Documentation/devicetree/bindings/arm/psci.yaml
>  F:     drivers/firmware/psci/
> +F:     drivers/firmware/psci/psci-devices.c
>  F:     include/linux/psci.h
>  F:     include/uapi/linux/psci.h
>
> diff --git a/drivers/cpuidle/Kconfig.arm b/drivers/cpuidle/Kconfig.arm
> index b88b01aa5829..f22e18b05053 100644
> --- a/drivers/cpuidle/Kconfig.arm
> +++ b/drivers/cpuidle/Kconfig.arm
> @@ -36,6 +36,7 @@ config ARM_PSCI_CPUIDLE_DOMAIN
>         bool "PSCI CPU idle Domain"
>         depends on ARM_PSCI_CPUIDLE
>         depends on PM_GENERIC_DOMAINS_OF
> +       depends on ARM_PSCI_DEVICES
>         select DT_IDLE_GENPD
>         default y
>         help
> diff --git a/drivers/cpuidle/cpuidle-psci-domain.c b/drivers/cpuidle/cpui=
dle-psci-domain.c
> index b9e4ad7d43a3..0ce6a83f6588 100644
> --- a/drivers/cpuidle/cpuidle-psci-domain.c
> +++ b/drivers/cpuidle/cpuidle-psci-domain.c
> @@ -9,10 +9,11 @@
>
>  #define pr_fmt(fmt) "CPUidle PSCI: " fmt
>
> +#include <linux/auxiliary_bus.h>
>  #include <linux/cpu.h>
>  #include <linux/device.h>
>  #include <linux/kernel.h>
> -#include <linux/platform_device.h>
> +#include <linux/module.h>
>  #include <linux/pm_domain.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/psci.h>
> @@ -122,14 +123,10 @@ static void psci_pd_remove(void)
>         }
>  }
>
> -static const struct of_device_id psci_of_match[] =3D {
> -       { .compatible =3D "arm,psci-1.0" },
> -       {}
> -};
> -
> -static int psci_cpuidle_domain_probe(struct platform_device *pdev)
> +static int psci_cpuidle_domain_probe(struct auxiliary_device *auxdev,
> +                                    const struct auxiliary_device_id *id=
)
>  {
> -       struct device_node *np =3D pdev->dev.of_node;
> +       struct device_node *np =3D auxdev->dev.of_node;
>         bool use_osi =3D psci_has_osi_support();
>         int ret =3D 0, pd_count =3D 0;
>
> @@ -177,16 +174,24 @@ static int psci_cpuidle_domain_probe(struct platfor=
m_device *pdev)
>         return ret;
>  }
>
> -static struct platform_driver psci_cpuidle_domain_driver =3D {
> -       .probe  =3D psci_cpuidle_domain_probe,
> +static const struct auxiliary_device_id psci_cpuidle_domain_id_table[] =
=3D {
> +       { .name =3D "arm-psci.psci-cpuidle-domain" },
> +       { }
> +};
> +MODULE_DEVICE_TABLE(auxiliary, psci_cpuidle_domain_id_table);
> +
> +static struct auxiliary_driver psci_cpuidle_domain_driver =3D {
> +       .probe =3D psci_cpuidle_domain_probe,
>         .driver =3D {
> -               .name =3D "psci-cpuidle-domain",
> -               .of_match_table =3D psci_of_match,
> +               .suppress_bind_attrs =3D true,
>         },
> +       .id_table =3D psci_cpuidle_domain_id_table,
>  };
>
>  static int __init psci_idle_init_domains(void)
>  {
> -       return platform_driver_register(&psci_cpuidle_domain_driver);
> +       return __auxiliary_driver_register(&psci_cpuidle_domain_driver,
> +                                          THIS_MODULE,
> +                                          "psci-cpuidle-domain");
>  }
>  core_initcall(psci_idle_init_domains);
> diff --git a/drivers/firmware/psci/Kconfig b/drivers/firmware/psci/Kconfi=
g
> index 97944168b5e6..68e381f1a618 100644
> --- a/drivers/firmware/psci/Kconfig
> +++ b/drivers/firmware/psci/Kconfig
> @@ -2,6 +2,20 @@
>  config ARM_PSCI_FW
>         bool
>
> +config ARM_PSCI_DEVICES
> +       bool "PSCI auxiliary device support"
> +       depends on ARM_PSCI_FW
> +       depends on OF
> +       select AUXILIARY_BUS
> +       default y
> +       help
> +         Say Y here to enable auxiliary device support for PSCI.
> +
> +         This creates auxiliary devices for PSCI functionality implement=
ed
> +         outside the core PSCI firmware driver. These devices allow PSCI
> +         child drivers to bind through the auxiliary bus while sharing t=
he
> +         PSCI firmware device as their parent.
> +
>  config ARM_PSCI_CHECKER
>         bool "ARM PSCI checker"
>         depends on ARM_PSCI_FW && HOTPLUG_CPU && CPU_IDLE && !TORTURE_TES=
T
> diff --git a/drivers/firmware/psci/Makefile b/drivers/firmware/psci/Makef=
ile
> index 1956b882470f..8e75a0ed6f74 100644
> --- a/drivers/firmware/psci/Makefile
> +++ b/drivers/firmware/psci/Makefile
> @@ -1,4 +1,5 @@
>  # SPDX-License-Identifier: GPL-2.0
>  #
>  obj-$(CONFIG_ARM_PSCI_FW)      +=3D psci.o
> +obj-$(CONFIG_ARM_PSCI_DEVICES) +=3D psci-devices.o
>  obj-$(CONFIG_ARM_PSCI_CHECKER) +=3D psci_checker.o
> diff --git a/drivers/firmware/psci/psci-devices.c b/drivers/firmware/psci=
/psci-devices.c
> new file mode 100644
> index 000000000000..f1eca61e3269
> --- /dev/null
> +++ b/drivers/firmware/psci/psci-devices.c
> @@ -0,0 +1,41 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#include <linux/auxiliary_bus.h>
> +#include <linux/init.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +
> +static int arm_psci_probe(struct platform_device *pdev)
> +{
> +       struct auxiliary_device *auxdev;
> +
> +       auxdev =3D __devm_auxiliary_device_create(&pdev->dev, "arm-psci",
> +                                               "psci-cpuidle-domain", NU=
LL, 0);
> +       if (!auxdev)
> +               return -ENOMEM;
> +
> +       return 0;
> +}
> +
> +static const struct of_device_id arm_psci_of_match[] =3D {
> +       { .compatible =3D "arm,psci-1.0" },
> +       { }
> +};
> +
> +static struct platform_driver arm_psci_driver =3D {
> +       .probe =3D arm_psci_probe,
> +       .driver =3D {
> +               .name =3D "arm-psci",
> +               .of_match_table =3D arm_psci_of_match,
> +               .suppress_bind_attrs =3D true,
> +       },
> +};
> +
> +static int __init arm_psci_init(void)
> +{
> +       return platform_driver_register(&arm_psci_driver);
> +}
> +core_initcall(arm_psci_init);

I think we should move this to arch_initcall().

To allow the platform driver to probe, the corresponding device node
in DT needs to get populated, which happens at arch_initcall_sync().

That said, to be consistent, we should move the cpuidle-psci-domain.c
from core_initcall to arch_initcall too.

>
> --
> 2.34.1
>

Kind regards
Uffe
