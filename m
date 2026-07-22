Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31B6848125C
	for <mfd@lists.linux.dev>; Wed, 22 Jul 2026 09:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784713849; cv=none; b=UXtjT9bNGraXmFXOygkNxelVogTMO5Z9wvf83QXj2bLOxTYw+Tc9rMdMvMC2rZO/f6B+XK3Qr1JE5r4SUgtwfsq8nm6vnvF3mtgHcsdj64Nk398J1lYHHcM6RO64DLSJwXvvc2Sl79TnUmTTiZ9micwtwTnUlscc+ySKL2IXtnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784713849; c=relaxed/simple;
	bh=zr58osoMX0jqB7Ny+PyJro8uAgdhkpoQJr5hOMzDFy0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YimSXoVqXwfjqLZDbu9626p3TrzHqxxOgOI7bzxyMKmZ/2/qyM8HHRBffy0StlfAbMbTbvX8XVBrerbVSDVX97Xx1mq6l/Ko9EEdHs8kak8OCMtTN7k1USetSUeYFOR9zAgzcGvkIIc39+8D8qPj6tocU1kdRTmj/lM5d4tD+iE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T+yPaN4x; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bwmvDcpD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T+yPaN4x";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bwmvDcpD"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M8xKRV237578
	for <mfd@lists.linux.dev>; Wed, 22 Jul 2026 09:50:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=d2S3NyHe7JKxNxgaSFpKvPq/
	rKGPVUbh4HkCUkp0pt4=; b=T+yPaN4xCigNC5oa/en9SmTdTOMoSifsGS8W2UkB
	S9UcGQ4BfvtI1dqU4J1vYhxtYjmkXBon6Wh8WsvDM6L8iiljaN41GLL9HJDejAUc
	QyphX2mpDQ2VAkhaTMUy3+JKTmWhb/RuIu6sPTuPX+30bFm8iL/ae5jztVsNsFHa
	Km9E+BDObU9X9c+Micf3Gc94VPX6hNALZToMRBhL4drApev1Osf64XVrTJQRezLt
	D0hBBjtQo3F0f2wZDL1zSGFSWXTsXU72Ghnr+b/46fzpJlbJcvO3xHn4cGCh2zPA
	tKE4idNRgv5yFu0tuwOvbB+XQo6M4bSppba9LGW9PDqYtg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjntn1gub-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Wed, 22 Jul 2026 09:50:42 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cefa1a2be6so108143785ad.0
        for <mfd@lists.linux.dev>; Wed, 22 Jul 2026 02:50:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784713842; x=1785318642; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=d2S3NyHe7JKxNxgaSFpKvPq/rKGPVUbh4HkCUkp0pt4=;
        b=bwmvDcpDn6/2AVEyeEOypmBzZ62pppcBjIHDA0yo+EEAkwSHOi6YjxBu2jcvijfxFV
         FdTMmvK6Tf1AdEm8McXkk3ryDeDJlA8cjapRjNg4UQvDyi/bSMElu3npiBe/P6WH2Rp6
         TyALSMMEZ/zAWxFzhOeFmjOR2ZzEbNQziPFZNzZetPoiRwe3L5PyIrXLTyqNrvffAOZG
         115K4xuz9vmIYWtfG/VFeBfTbuLJ/4n6DbQ7TYjYSd3A2mgof2LCk5pE+LzkiwAffx8A
         HYxssBSj++hzqR3trdRzOJb6ZkTkRAscMAI2FGmaihV6M+52dtEQGCIaXORSuBSb3mjD
         hUcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784713842; x=1785318642;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d2S3NyHe7JKxNxgaSFpKvPq/rKGPVUbh4HkCUkp0pt4=;
        b=caatXOa2ubeoBqD0Ny0cC2O+CZECmZTNKJSOCghaHW9UXjXl3oms4uzoyzG8/OfOie
         4Za7rxTS90LUhF1FEzO2DtFlxJj+xFBfEv2f+oB/MvszYqH6HC6K28wfKY/7U66/1DFN
         9792FBqONmBT3j5qhSKDEjYtfJoRb7b99bUKp/V5Tn2Eg47X8Ukn0bw75FX9dmbjvIO/
         idW0CGhd9ldtGqHXyxBEDe6tyhVFxpAY0d5mMXxe4vjtwjBD05GPsEWnR4d/Ez/k6YwM
         Cys4Er37vJcvX0IEqbpgPgSjMDsU1d6M8GYetA3UjZC+yPOew6+wnCSiWW316y59qp/X
         ospg==
X-Forwarded-Encrypted: i=1; AHgh+Ro8WABlRhebiavkJlMNfykrNgN6u/KzqEyIMVMc1jnxJqhKnB3p1do9ZjmtDM8R8fnZNyk=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz65zxuexPp/MilWlJ2iFaUTYCdD7pM3jkAtu74IYePSAu7W/OP
	U4KNpq6FQqoPV/LXmUw0/WEqDHfhlmbvYds2u5oCxRQ0S6nLneN+albotbDAWNe7s5W2E47HDJv
	2FBxm93Uh6B/+J8EWBEPsT7rl3D3GWwafWCRRf6S+9+2mU/smcUzlnDY=
X-Gm-Gg: AR+sD11SSUBCQlwqdOHZgZPdYG4UNILuRUTC6HUmOJ/c5vhGHZfXAS81qhkYEClivnS
	W2++rGUwXMUXIE/CQK1x2A3/VZxIxYgFJUrrcC8CowmHvTx4TpEcAHQIKf+Yo8+vjcKcYgnjULO
	p3J1QvYBtcHsxq+e8cCLKyyrFtt/WcemSTa2U+fKsOUEqzpqaPz2MwrbVVi1vxTVjzujd4gi55a
	4Y/8+KUg/3UvrAR5DU/hvin0ipc+t3g9qVkFvIE4x6OksIgTddaVISpBH2j2sZBejWsBz7f2Mdb
	DfpxvcAnV1Je2mjFxT95E5gcNXHliqGX+zCS1UitDKp/3G16FdjWYrW6R5lkzTLXRqEiSTkPUPA
	ecqRqn+3HKA/yHp734PzuzqBxiR0f45yv4Q==
X-Received: by 2002:a17:903:15cf:b0:2ca:be8:62d with SMTP id d9443c01a7336-2cf349b5923mr232470475ad.32.1784713841737;
        Wed, 22 Jul 2026 02:50:41 -0700 (PDT)
X-Received: by 2002:a17:903:15cf:b0:2ca:be8:62d with SMTP id d9443c01a7336-2cf349b5923mr232470145ad.32.1784713841271;
        Wed, 22 Jul 2026 02:50:41 -0700 (PDT)
Received: from hu-pkondeti-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147dc8b0cdsm7758862eec.11.2026.07.22.02.50.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 02:50:40 -0700 (PDT)
Date: Wed, 22 Jul 2026 15:20:28 +0530
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
Subject: Re: [PATCH v23 02/13] power: reset: reboot-mode: Support up to 3
 magic values per mode
Message-ID: <38115586-9913-4d6e-9447-e82aee811dd1@quicinc.com>
References: <20260714-arm-psci-system_reset2-vendor-reboots-v23-0-e7453c548c21@oss.qualcomm.com>
 <20260714-arm-psci-system_reset2-vendor-reboots-v23-2-e7453c548c21@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260714-arm-psci-system_reset2-vendor-reboots-v23-2-e7453c548c21@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=AJsSZ1gA c=1 sm=1 tr=0 ts=6a609272 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=2zDJ_gd8kjYVRJQFbS0A:9 a=CjuIK1q_8ugA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: hgu87QuvdLmk7qsWOQa41MUBaEPrFz7g
X-Proofpoint-ORIG-GUID: hgu87QuvdLmk7qsWOQa41MUBaEPrFz7g
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDA5MiBTYWx0ZWRfX/fk0q83jNIyf
 AJrglI0rftmiT36e183Pp5Ede2Bm1TlECZ3+LQoA3haFB3nWh1AKfvFq3rgpzCUNlGJmzhiZTVs
 b4PCt4SZGZEC4l99eB4AyefbAmRO104=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDA5MiBTYWx0ZWRfXyU7EtFfJ6Iif
 K3by2KgUGUL1oOfQomUH99Rw/lmM/6bxx8pN4fypLikeUGxIn7qz8fQa+QNMOM1vnULrbYOf64d
 dSsPw7gCC6v51pajVcAOqmUyn+3+JII3vGVU8Bo5W64D02xZORYD1q+J2J8PuH1GFv/iVhyus4+
 n1Ll8t2ZsjDXbuTc877cCvvjL3V6orgIfFqPHeJWB83m7LGUJsxbWz+oXodSqOWS/bQl/ZsMvEI
 YCE8ideDGIr8BYuc8XT/iOO1mx4dNxOlIbTDSvguYNKN+jw4xM1S7DCuFtnsvOuxNwF8PWTEd/i
 Kd+lLTc6lVfNpQJKCkbWcqM/7lqOllEVYutwl13u52if4i0VIxACCge+0PaJ0LbIpKh38ce4OdT
 JCiK1YqHnYHFePi46cGySz4Nxvz5+sqsLz8pYvYFYsAXvhf+XhcydR4g66Qoz7aC2JpT1OhY4zj
 Vt1Xt7zQkt92c9zLWtQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_03,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 bulkscore=0 adultscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220092

On Tue, Jul 14, 2026 at 10:46:30PM +0530, Shivendra Pratap wrote:
> ARM PSCI vendor-specific resets, require a 32-bit reset_type and a 64-bit
> cookie as arguments. This cannot be implemented via the reboot-mode
> framework, which supports a single 32-bit argument as magic value.
> 
> Extend the reboot-mode framework to support up to three 32-bit arguments
> as magic, per reboot-mode.
> 
> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
> ---
>  drivers/power/reset/nvmem-reboot-mode.c  | 10 ++++----
>  drivers/power/reset/qcom-pon.c           |  8 ++++---
>  drivers/power/reset/reboot-mode.c        | 41 +++++++++++++++++++++-----------
>  drivers/power/reset/syscon-reboot-mode.c |  8 ++++---
>  include/linux/reboot-mode.h              |  4 +++-
>  5 files changed, 46 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/power/reset/nvmem-reboot-mode.c b/drivers/power/reset/nvmem-reboot-mode.c
> index d260715fccf6..ac69b5f39fb4 100644
> --- a/drivers/power/reset/nvmem-reboot-mode.c
> +++ b/drivers/power/reset/nvmem-reboot-mode.c
> @@ -17,14 +17,16 @@ struct nvmem_reboot_mode {
>  	struct nvmem_cell *cell;
>  };
>  
> -static int nvmem_reboot_mode_write(struct reboot_mode_driver *reboot,
> -				    unsigned int magic)
> +static int nvmem_reboot_mode_write(struct reboot_mode_driver *reboot, u32 *magic, int count)
>  {
>  	struct nvmem_reboot_mode *nvmem_rbm;
>  	size_t buf_len;
>  	void *buf;
>  	int ret;
>  
> +	if (count != 1)
> +		return -EINVAL;
> +

The count can be different per mode. Because `struct mode_info` has
`count` member. This single `count` check across all modes may not be
useful.

Either drivers need to use count passed to them or drivers needs to
receive `struct mode_info` in the callabck.

Thanks,
Pavan
