Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FBF747A0C4
	for <mfd@lists.linux.dev>; Wed, 22 Jul 2026 09:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784712297; cv=none; b=QEs23ClEvUe9ko0pWhotqcyymcty2GsZ0L5kAe6JhMlY9LdtPJMCWpMIuUqulS8FGNjudnLH7D7aYAw+VBhB5b024lEOjCBBiHvWlobvA1v5DinVZKJsEqUaZjElC47VDEzREOdfh0zr3WiagpW9uWxBv52FsUe/i7ppU/3xsac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784712297; c=relaxed/simple;
	bh=SISakai73oYIJow0GtA/f/yfN5PL5Ym7FWvKCPwBvDQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ea3USEaFwuuWFsp2RXuLvm9Tde1EFAPGKsxfmuPB/vgCkCoVH6MuJCRB8OOAR+KQbHlbX2aVemaYTzu5x+Q1OjnWfhDByNdJJqSSK5lJDcJKJVWgG0FB06vGQqrk3l/IKl5pcvqDCyMkE1KWCJuU9HSF3J9rES4xzoseVqQcoOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UxgQmBBu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dBJoc/nq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UxgQmBBu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dBJoc/nq"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M8xKwn237638
	for <mfd@lists.linux.dev>; Wed, 22 Jul 2026 09:24:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=fke8mFdUXzCYoX7ahByeU8GI
	IeCclhKRXZ6jSKAjmZE=; b=UxgQmBBu/l8Usm+sEobPvkgPPpZxVTwV3WMArMoQ
	YyacCNVKE43UbTz2/yGm3hqQKFm+uB+TaTYaECZ/EYe50DIJaGg/9rw6MvdYZ62p
	fMlfLtM6YpCPIiweeNviO4V2iX1+Zrd5QQ5voGYYoTNfW6XuvjrINj5G1SF4JQ1d
	E8Sbkkv00sxjuViLxaKcnGCQov6km1S3sy3ely2nYwCMOGUKbWcC7DFDG9WUQmMX
	FK7QDH5k2CbtVJ/FcjBE3xag+jAnLaqOrStEl7iRiGHe8nFtExbAXnIzBq6B2rX7
	cEhIbNT7KOW/K3q8U5XH93cABFiAgjmW1Mwrfp2ueJntUw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjntn1cf6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Wed, 22 Jul 2026 09:24:53 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ca5d2474c7so229406125ad.2
        for <mfd@lists.linux.dev>; Wed, 22 Jul 2026 02:24:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784712292; x=1785317092; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fke8mFdUXzCYoX7ahByeU8GIIeCclhKRXZ6jSKAjmZE=;
        b=dBJoc/nqFuKAJyeQd4n7HxqJw+qfTFsB74iilXNgmXlow8VQubbdPOJKQkQQVWJPTM
         gbmEdmIR+7dwcbBFCge/5VkozaFRr2Wdrgzw4dAIuhpQcU9GT1lDoFuof4j2ISKBeuz/
         akPy1oq3iEDQQ4SVeuF0dACbKKYWx+75ITgwa/K268UFz1GrRRnB4KhDOe18e/4p065P
         qvUL4DrBTt56DqlTlMfLZCZKMLs1W3cKuOiCLjv3XO/osKfS2PNtOjyhRRw5HNSjqPiq
         6nWzSwsnj4Mj+icwEhEHL7Bgf0E9FW/VhMBZcXRRXClv35MWckui0LExMo0+krp9UlLw
         +73A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784712292; x=1785317092;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fke8mFdUXzCYoX7ahByeU8GIIeCclhKRXZ6jSKAjmZE=;
        b=JhExbVEwLEugNdFUoEOp8yOzbKHwjmXXDTP0+W+gMWRDM3JTSFsW967OHLv7Q+W2Wr
         FHGN21r6pwYHyhwgXdkqI0HIEsEfFq6/qJldK5+CJuGn4c14yOEIiagLvivfVrW0QE3e
         NZxI9JFSDlGO/k8Q2LBfrkjVC4+CDr5BKBR7X2IKTWMExPe5YiBb/Y1a509KFCs+bCZg
         vQn7ER7U1aLZ/vZ0KM8rkIaPLntPtgN5OBLgk6zZBFWOoUEvsThj0tsQqse0gAQYZcM/
         MQUg5dyYQVLf2tAPmqY2btsSLRbSU62wrWLJMUolB8gjDnWhf72qZPaxnq0eQxWSSF9K
         vtTA==
X-Forwarded-Encrypted: i=1; AHgh+RqSxrU5o5Xiz4PnzvALUYScTeTGTHdY+UFQ4ZmsVVf8LXlqZQpmvzFD9c9hiezypIQiGPw=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyvpz1CkDJqc1qKYQK9oraYXfXmG1BbK3BCCcb5zUsnwe0W0iyb
	yLSijJMpq6Jr/dPseeoqUUICTa4v15n8lwaw2CttN5mkZlcDZAuvRf+fkDocgFhwD3VMW5YX4p9
	2KudvN0kW3bH+pI10HIVbIWznEjxtfNbIghaYCVfjtfrOj1VuL0oNocM=
X-Gm-Gg: AR+sD11kYeU91hpSf8SSOf3IGsEdSNihGDKntU+c7hnaXHRfQmnN+MhdAphnMSFcL2K
	ggqQrP21dGPfiEAUiL3qTPvh/gatdzJDkflhy00jKzpjb2hqJnr50X8M8hK20Kzr4E/HkfuKYxM
	PVCxXF/DOfenoZhacGkic0KNUKkp3vrcZPXkpIVl0QYA/k2b/10RUbI51GhD1CkXBDS+0AAONDi
	j1ac7gOgAKtaWBU4Qz25nnoqP+vyua/RWIuSJg4FXZGuWxTq1YztxLDdet+U4xKD7r4WCZXyLxu
	YBC0wVfPElRereRfuc60aV1IbsOkKyHWwDSIdqBVDxDNVwyBHx9CoPm1IjlW2C6xPUC/BuRqGgx
	TgRLuAr8FLxtgFOdmNi0Tx6HzJpbtjQchMQ==
X-Received: by 2002:a05:6a20:ae2f:b0:3c0:9c1b:d0bf with SMTP id adf61e73a8af0-3c3ad9ec960mr21354570637.74.1784712292190;
        Wed, 22 Jul 2026 02:24:52 -0700 (PDT)
X-Received: by 2002:a05:6a20:ae2f:b0:3c0:9c1b:d0bf with SMTP id adf61e73a8af0-3c3ad9ec960mr21354519637.74.1784712291669;
        Wed, 22 Jul 2026 02:24:51 -0700 (PDT)
Received: from hu-pkondeti-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147e081985sm7587907eec.23.2026.07.22.02.24.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 02:24:51 -0700 (PDT)
Date: Wed, 22 Jul 2026 14:54:39 +0530
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
        mfd@lists.linux.dev, Srinivas Kandagatla <srini@kernel.org>
Subject: Re: [PATCH v23 04/13] firmware: psci: Introduce command-based resets
Message-ID: <282fd166-2074-48cd-84ce-c887711e51c5@quicinc.com>
References: <20260714-arm-psci-system_reset2-vendor-reboots-v23-0-e7453c548c21@oss.qualcomm.com>
 <20260714-arm-psci-system_reset2-vendor-reboots-v23-4-e7453c548c21@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260714-arm-psci-system_reset2-vendor-reboots-v23-4-e7453c548c21@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=AJsSZ1gA c=1 sm=1 tr=0 ts=6a608c65 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=hbohSISKQUe5WVyMY20A:9 a=CjuIK1q_8ugA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: rrPY6Tj_N1qAjPxUXUzGw6buxu5p7rtW
X-Proofpoint-ORIG-GUID: rrPY6Tj_N1qAjPxUXUzGw6buxu5p7rtW
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDA4OCBTYWx0ZWRfX/PIjRaoPnDZf
 aUb/6cuhmtjK3ElvvKZb2LMCOWxTOvKDl1ou+cRzXNKCfXPXCfjpQpaw5Xnq3/CQzoqUg1rpm0M
 5b1ifW8QXNyAzdqmqel6820Matbz4JY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDA4OCBTYWx0ZWRfX5/G80IS7GC8L
 5pUKIry5Ryl0dFEOOiGNmw8OzaT3MvjuCoxMykXtTGbD8FtyeOOpTVtKKPrRP3i0MHRuhM6RfOD
 4OlDCqVaAyL3V+16pI9dilKGpqmgGJBplOo+XQluAJ/ci8+NLHn32cqeaMdo0Lu5q/YlDlKXfLt
 9OZMopt0CY/AwB68uMqW04W8efa3gb1+Uap6MTSGBfPzpqzhCFuNThrKjgfcn9roI3O5w+SqmNL
 /7RcPncmS5B7FkbJYPzK2FHwHNTLohb+PYRYCobAIzOyRQyQ5xmUis7WPPUb/AIaj8imL8FmjZk
 iHWXtdqAeLBqz3judD3Kv7+loZ7xMUE+aTYAUC/KOBZz8Zi+7Y7t8WrSYzzQV4D3idV8nA4IGrq
 su0PQG/5VYkrTtw6zsGLRPlPzuxUadSFDeUwJKTg56tB1XA9tnqDlZ7kq9lGtKxYaQOIcRy3WsL
 yD5rTUOzLQkAkdOObHw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_03,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 bulkscore=0 adultscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220088

On Tue, Jul 14, 2026 at 10:46:32PM +0530, Shivendra Pratap wrote:
> PSCI currently supports only two resets - SYSTEM_RESET and SYSTEM_RESET2
> ARCH WARM reset. The reset patch is selected based on the Linux
> reboot_mode variable. The PSCI specification now includes SYSTEM_RESET2
> for vendor-specific resets but there's no mechanism to issue these
> through psci_sys_reset().
> 
> Add a command-based reset mechanism that allows external drivers to set
> the PSCI reset command by passing a reset_type and a cookie.
> 
> Add support for the following reset commands:
>   - SYSTEM_RESET2 vendor-specific resets.
>   - SYSTEM_RESET2 ARCH WARM reset and SYSTEM_RESET (reset_type = 0 and
>     cookie maps to psci_standard_resets).
> Unsupported commands fall back to the regular PSCI reset path.
> 
> Default to the existing reboot_mode-based reset flow unless a reset
> command is configured. If a kernel panic occurs after a reset command is
> set but before the final PSCI reset is issued, ignore the reset command
> and follow the normal reboot_mode-based reset path.
> 
> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
> ---
>  drivers/firmware/psci/psci.c | 106 ++++++++++++++++++++++++++++++++++++++++++-
>  include/linux/psci.h         |  36 +++++++++++++++
>  2 files changed, 140 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/firmware/psci/psci.c b/drivers/firmware/psci/psci.c
> index e73bae6cb23a..881819d09911 100644
> --- a/drivers/firmware/psci/psci.c
> +++ b/drivers/firmware/psci/psci.c
> @@ -12,7 +12,9 @@
>  #include <linux/debugfs.h>
>  #include <linux/errno.h>
>  #include <linux/linkage.h>
> +#include <linux/mutex.h>
>  #include <linux/of.h>
> +#include <linux/panic.h>
>  #include <linux/pm.h>
>  #include <linux/printk.h>
>  #include <linux/psci.h>
> @@ -51,6 +53,14 @@ static int resident_cpu = -1;
>  struct psci_operations psci_ops;
>  static enum arm_smccc_conduit psci_conduit = SMCCC_CONDUIT_NONE;
>  
> +struct psci_system_reset_cmd {
> +	u32 reset_type;
> +	u64 cookie;
> +};
> +
> +static struct psci_system_reset_cmd reset_cmd;
> +static DEFINE_MUTEX(reset_cmd_mutex);
> +
>  bool psci_tos_resident_on(int cpu)
>  {
>  	return cpu == resident_cpu;
> @@ -80,6 +90,62 @@ static u32 psci_cpu_suspend_feature;
>  static bool psci_system_reset2_supported;
>  static bool psci_system_off2_hibernate_supported;
>  
> +static u32 psci_get_sys_reset_fn(void)
> +{
> +	switch (reset_cmd.cookie) {
> +	case PSCI_SYSTEM_RESET2_ARCH_WARM_RESET:
> +		if (psci_system_reset2_supported)
> +			return PSCI_FN_NATIVE(1_1, SYSTEM_RESET2);
> +		return 0;
> +	case PSCI_SYSTEM_RESET_COLD_RESET:
> +		return PSCI_0_2_FN_SYSTEM_RESET;
> +	default:
> +		return 0;
> +	}
> +}
> +
> +/** psci_set_reset_cmd() - Configure PSCI reset command
> + * @reset_type: SYSTEM_RESET2 vendor-specific reset_type as defined by
> + *		firmware, or 0 for standard resets
> + * @cookie: SYSTEM_RESET2 vendor-specific cookie as defined by firmware or one
> + *		of enum psci_standard_resets when @reset_type is set to 0
> + *
> + * Supported commands:
> + * - PSCI SYSTEM_RESET2 vendor-specific reset:
> + *   - @reset_type and @cookie must follow platform-specific SYSTEM_RESET2
> + *     vendor-specific resets.
> + * - Standard reset selector:
> + *   - @reset_type must be 0.
> + *   - @cookie must be one of enum psci_standard_resets.
> + *
> + * This is an in-kernel helper intended for built-in reboot flow callers.
> + * reset command can be set only one time per boot cycle.

This comment may need re-phrasing. Please check.

> + *
> + * Return: 0 on success, -EINVAL if both inputs are zero, -EBUSY if reset
> + * command is already set.
> + */
> +int psci_set_reset_cmd(u32 reset_type, u64 cookie)
> +{
> +	if (!reset_type && !cookie)
> +		return -EINVAL;
> +
> +	scoped_guard(mutex, &reset_cmd_mutex) {
> +		if (reset_cmd.reset_type || reset_cmd.cookie)
> +			return -EBUSY;
> +
> +		reset_cmd.reset_type = reset_type;
> +		reset_cmd.cookie = cookie;
> +	}
> +
> +	return 0;
> +}
> +
> +bool psci_has_system_reset2_support(void)
> +{
> +	return psci_system_reset2_supported;
> +}
> +EXPORT_SYMBOL_GPL(psci_has_system_reset2_support);
> +

Do we want to add namespace based restriction on who gets to import
EXPORTs added in this patch?

>  static inline bool psci_has_ext_power_state(void)
>  {
>  	return psci_cpu_suspend_feature &
> @@ -306,8 +372,24 @@ static int get_set_conduit_method(const struct device_node *np)
>  	return 0;
>  }
>  
> -static int psci_sys_reset(struct notifier_block *nb, unsigned long action,
> -			  void *data)
> +static void psci_handle_reset_cmd(void)
> +{
> +	u32 psci_sys_reset_fn;
> +
> +	if ((reset_cmd.reset_type & PSCI_1_1_RESET_TYPE_VENDOR_START) &&

What is `_START` significance in PSCI_1_1_RESET_TYPE_VENDOR_START macro?

> +	    psci_system_reset2_supported) {
> +		/* PSCI SYSTEM_RESET2 Vendor-specific reset */
> +		invoke_psci_fn(PSCI_FN_NATIVE(1_1, SYSTEM_RESET2),
> +			       reset_cmd.reset_type, reset_cmd.cookie, 0);
> +	} else {
> +		/* Retrieve the psci reset function from reset_cmd */
> +		psci_sys_reset_fn = psci_get_sys_reset_fn();
> +		if (!reset_cmd.reset_type && psci_sys_reset_fn)
> +			invoke_psci_fn(psci_sys_reset_fn, 0, 0, 0);
> +	}
> +}
> +
> +static void psci_handle_reboot_mode(void)
>  {
>  	if ((reboot_mode == REBOOT_WARM || reboot_mode == REBOOT_SOFT) &&
>  	    psci_system_reset2_supported) {
> @@ -320,6 +402,26 @@ static int psci_sys_reset(struct notifier_block *nb, unsigned long action,
>  	} else {
>  		invoke_psci_fn(PSCI_0_2_FN_SYSTEM_RESET, 0, 0, 0);
>  	}
> +}
> +
> +static int psci_sys_reset(struct notifier_block *nb, unsigned long action,
> +			  void *data)
> +{
> +	/* The function psci_handle_reboot_mode follows reboot_mode based
> +	 * reset flow and psci_handle_reset_cmd uses reset_cmd based reset flow.
> +	 *
> +	 * The reset_cmd is configured at the reboot_notifier phase. If a kernel
> +	 * panic occurs between the reboot_notifier and this final reset, skip the
> +	 * command-based reset and let reboot_mode drive the reset flow.
> +	 *
> +	 * The function psci_handle_reset_cmd invokes non-returning PSCI SYSTEM_RESET
> +	 * calls to reset the device. If it returns, either the reset failed, or the
> +	 * command was unsupported. Fallback to reboot_mode based reset flow.
> +	 */
> +	if ((reset_cmd.reset_type || reset_cmd.cookie) && !panic_in_progress())
> +		psci_handle_reset_cmd();
> +
> +	psci_handle_reboot_mode();
>  
>  	return NOTIFY_DONE;
>  }
> diff --git a/include/linux/psci.h b/include/linux/psci.h
> index 4ca0060a3fc4..39fe0edec651 100644
> --- a/include/linux/psci.h
> +++ b/include/linux/psci.h
> @@ -8,6 +8,7 @@
>  #define __LINUX_PSCI_H
>  
>  #include <linux/arm-smccc.h>
> +#include <linux/errno.h>
>  #include <linux/init.h>
>  #include <linux/types.h>
>  
> @@ -21,6 +22,16 @@ bool psci_power_state_is_valid(u32 state);
>  int psci_set_osi_mode(bool enable);
>  bool psci_has_osi_support(void);
>  
> +/**
> + * enum psci_standard_resets - Standard reset selectors for PSCI reset
> + * @PSCI_SYSTEM_RESET_COLD_RESET: Standard SYSTEM_RESET command.
> + * @PSCI_SYSTEM_RESET2_ARCH_WARM_RESET: SYSTEM_RESET2 architectural warm reset.
> + */
> +enum psci_standard_resets {
> +	PSCI_SYSTEM_RESET_COLD_RESET = 1,
> +	PSCI_SYSTEM_RESET2_ARCH_WARM_RESET,
> +};
> +
>  struct psci_operations {
>  	u32 (*get_version)(void);
>  	int (*cpu_suspend)(u32 state, unsigned long entry_point);
> @@ -45,8 +56,33 @@ struct psci_0_1_function_ids get_psci_0_1_function_ids(void);
>  
>  #if defined(CONFIG_ARM_PSCI_FW)
>  int __init psci_dt_init(void);
> +/**
> + * psci_set_reset_cmd() - Configure PSCI reset command
> + * @reset_type: SYSTEM_RESET2 vendor-specific reset_type as defined by
> + *		firmware, or 0 for standard resets
> + * @cookie: SYSTEM_RESET2 vendor-specific cookie as defined by firmware or one
> + *		of enum psci_standard_resets when @reset_type is set to 0
> + *
> + * Supported commands:
> + * - PSCI SYSTEM_RESET2 vendor-specific reset:
> + *   - @reset_type and @cookie must follow platform-specific SYSTEM_RESET2
> + *     vendor-reset encoding.
> + * - Standard reset selector:
> + *   - @reset_type must be 0.
> + *   - @cookie must be one of enum psci_standard_resets.
> + *
> + * This is an in-kernel helper intended for built-in reboot flow callers.
> + * reset command can be set only one time per boot cycle.
> + *
> + * Return: 0 on success, -EINVAL if both inputs are zero, -EBUSY if reset
> + * command is already set.
> + */
> +int psci_set_reset_cmd(u32 reset_type, u64 cookie);

The very same comment is present in the implementation of this function.
Please fix it.

Thanks,
Pavan
