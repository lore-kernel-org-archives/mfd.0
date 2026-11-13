Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794571839;
	b=bEvy5XAiFlf9slIEbd0Bn8RWcGZI2PoEk5eNHpr4pfMqdjrHd850RB5ccf9KvyNf2G9+
	 GRkuOwBQW+mf1GMrkYyEqE70p06wjNnyCMbKyU0diwCe1nZQwW9JHuUCt/8QCrItYm0zE
	 HGsFlgEKaYqYjn13RQAiSyWGwaueK8V0vs6vqAtMGRWR0JXgsmVod+2Ci0ns6UFikVGYF
	 5JkIUyHVqAn7bcIWDdEeOKiTZ6L7iHuO9h3qzwjmj54klFOAJyFjoSNm3VN15lFyHkeDX
	 xFI5KV2nzW6pqXPgri7Ptdq4zwVGzioOeEya9oBflrBpOteg9LWErAEJOZbH3GcN9Yg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794571839;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=4hEbvuDKTvq5Xc54WAfLx4GkA5m8TdMCxYJefmo5WTU=;
	b=STfPui6kR37nPBu5Gbn7mr7smcYSehp80arGrbsqAUQoVz56FDL+2meSJaTjYe/LUvo4
	 RBWHEk3HKKTYqslv3SnQRyvzh30+8qmU2RPHn9pT9y6pUL4ZOt5EOhoM50RrSlyQInY1q
	 4Jf0c3xfM1dbup1cTtEweSvXWuE+w4t7FGr0UNe2ySK2kFcOpGRIrWsy5oGGu/7TDjvBl
	 Q7K4SRIUGTTI0VyrXxDXMVRQKnkl4A01DsfkQQkmhpZ5OriD46iqJYANyh3f+KYpICJ1d
	 RKj2H07OMLxilqxdPeNGXN+8Sa2WzDDpxMwsZr9kDmUY4YTdMaXVFaaU0+QQCKPvuDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ObBtv92B;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="hb4/IXMH";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6700606A32E
	for <mfd@lists.linux.dev>; Fri, 13 Nov 2026 12:10:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B6700606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ObBtv92B;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hb4/IXMH
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADC0hRu525307
	for <mfd@lists.linux.dev>; Fri, 13 Nov 2026 12:10:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4hEbvuDKTvq5Xc54WAfLx4GkA5m8TdMCxYJefmo5WTU=; b=ObBtv92BXUpOERJ+
	2WgyEdl4lbkD7pOLZH5GrGlE+98lvcAtyZbrkhFvxZIDGjJzZVfGGQmQjOzKKPqb
	9K3j6lvWgfinVvqZG47jlC4w4AXyt/jPlZVU3WapMHA5Sy+vPNw8jOIillPbbq6L
	wKuOh5azgiMcnunj/Z40CesmKcHwMvZhU5R0KC1cbbj3u36fdS1l5b/z7PXJ2iY+
	zLZIH7q5h76zuRurP7DnTiUTYFek03tFCNYM1cnBI3UTlIm+56yJ1kG7RpaJMMys
	1+TvvsDds1L1WqJ+1M8yRZjaLK3jgQVzjL33ANFBF7C2BLbiqj6+tEyCd7ssXpN/
	08SwdA==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwh0akmq1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Fri, 13 Nov 2026 12:10:37 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7cc0ae52207so11778137.2
        for <mfd@lists.linux.dev>; Fri, 13 Nov 2026 04:10:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794571837; x=1795176637; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4hEbvuDKTvq5Xc54WAfLx4GkA5m8TdMCxYJefmo5WTU=;
        b=hb4/IXMHevVt/6uw7rCSnjbTeBdtFm86HYafDw5bGoISqVHaK1gag44VA6TvanGex9
         i5Lh+6zTvfuRIAcwAr+GH+oosHBc0qpv/DhHTh2UH1Q4+p7ghfZvB1tdxu+nyivCdLQA
         soNUO0E/PizZMnWUzjnipd8xrBpUHYo9FDIpqiXe1qOIJTFs8jsnpN31N6WQHnD4JDN+
         WpsqZPN/57R1ptCPfFDgnlJTJczCoBF9dLrG0Xabsfx9j/j7+mj3Tw5XEI3MQqctW8Yp
         2VACHfNJrFa/8IESCMNonSP2PNN9FXBEgGfMzWTRFFjd/NGUH7XBQMxw3/vNLH/la3J8
         8IQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794571837; x=1795176637;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4hEbvuDKTvq5Xc54WAfLx4GkA5m8TdMCxYJefmo5WTU=;
        b=pwXbCXGZ7rZE7h+GgQ/vS3CzAJVGnkzNt31ip3EQo5YXVqMhgXnWQdRlzinTNf8ODz
         VPK0RuQTatUQtAupCNOeZvQt7QWc5D5UAAkjrEyCySnTnB/l92bsBzfmIpamDBLUeqWC
         hZzR47wc2RL67Q2PbDDgV+lUISsyWMFnL1f+jG3oHFltM7FSNDrgCTTP93QmSUMQW20B
         kNJ6KyTIhulE/kdaOA8g2Lw+RXNZczpbKLs3RZy7IQU6Lc6N6Ct9jya7n7PvEpkLaFb6
         2335LRKSgQbwHanMt+o9LclF1NJf+r7X+wWCz3WuMyotLAPwABUvu3yhaKyurkMoK7PV
         7PRg==
X-Forwarded-Encrypted: i=1; AL+hErEsiSAI34oylIemFipyHTqmDlztbxbiCqtef8biLKkj1gQbe5aBTppsUcXEdX5rA5NB+LA=@lists.linux.dev
X-Gm-Message-State: APuU4Z9s7CO7dp/1DxjqAEQpaHPRhfS4Dxa6ARaNkfY3HRlBlaLh5/eI
	imQaN1OfrbonFWtdXQHicyQCsiz6mBuoJjhkFabd9DkxSXDv9LLpYmGfLRYaSSJWK7v28aQZn5a
	offG4G03vQ+bd1VqBmAKZ+7hJ7udjyOSq5IQa8vSYY8AGXms1CFu3XjU=
X-Gm-Gg: AYBFou1qhiHgJb7llCLuQC3creXWTsE/UkIqOp6fokOHmad5tHWOaM01OyerOYG9iqx
	lAe49kjqwW61/13CsJ+NHSigSFTEt8i8+Bds6MjhOtNZahzYXkFnBbhDqo/nX9bHm2lLPGRTYAw
	bDVgy3wrQoMhu2TOFOzEqUu5wJdmCQDSltoFv+kfHvYRT6GSjmEzZkDLv/Umov4c6U408VdvPVO
	nOJ+XI6QqrPC0DG+yxozLIn/N3+eZhblm0fQP93ryhudcXGhU1T4TIoeK5+U3shOSxvoEC4kdK1
	/9551Iy8Lko+VD1MEXTRZ1Ik0MoyftXz4NLQVQrmX/iQhbXx0gVauctAqdhjNCapJv9gSMaxVsC
	1dxSMkDh7djSVaF9qbGqwtacyP6JcMO+U2VTYHz6hbYNMUnMKS3pKnFeV8gGu6JTD7qnkW80=
X-Received: by 2002:a05:6102:61d6:20b0:7cc:32ce:4c41 with SMTP id ada2fe7eead31-7d64d6c510emr550082137.2.1794571836872;
        Fri, 13 Nov 2026 04:10:36 -0800 (PST)
X-Received: by 2002:a05:6102:61d6:20b0:7cc:32ce:4c41 with SMTP id ada2fe7eead31-7d64d6c510emr550065137.2.1794571836420;
        Fri, 13 Nov 2026 04:10:36 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b7c23ddf82sm870968a12.26.2026.11.13.04.10.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 04:10:34 -0800 (PST)
Message-ID: <0cac5090-a135-4a6c-8221-846b34ed5513@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 13:10:29 +0100
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 16/17] arm64: dts: qcom: Add initial Halliday dtsi
To: Stanislav Aleksandrov <lightofmysoul@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>,
        Lee Jones <lee@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Bart Van Assche <bvanassche@acm.org>, Bean Huo <beanhuo@micron.com>,
        Stanley Jhu <stanleyjhu@google.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Georgi Djakov <djakov@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mfd@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        linux-usb@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-scsi@vger.kernel.org, linux-crypto@vger.kernel.org,
        linux-pm@vger.kernel.org
References: <20261109-halliday-dts-v1-0-289114ab8197@gmail.com>
 <20261109-halliday-dts-v1-16-289114ab8197@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261109-halliday-dts-v1-16-289114ab8197@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA0OCBTYWx0ZWRfXwWUh5v/L+MXM
 /FkgxVks6LKTdEgRjygJ1Bk3SBrhoMJjdm3vADSJbo3uHwoiMDpITvqRzIsDr9p/DmQGoGMTAyD
 djo78YXPdzgAw5iNIeu3eJMJj5aRBYM=
X-Proofpoint-GUID: 2pa04PSGpIU5ymBnQIR1tcS9hr7F-Fg_
X-Authority-Analysis: v=2.4 cv=N+e8hG9B c=1 sm=1 tr=0 ts=6af6fe3d cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=pGLkceISAAAA:8 a=U5E2jiqv92kUeAjINO8A:9 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA0OCBTYWx0ZWRfXzSa3SWrH15Pw
 dUAGeCTKlBo7PqdbGcaLGL0nwTJ3+IQsd7qK54NG6LA6y6gXDeVIGiXqz5RZDdPmB6X4vBq/+R0
 e3D9bs9kDDklLYVh0iiZQbr7uRpbtMsR5vTQX9Bwt/7s7QXMH5+k6Lbx9FSq9mP9plnaYz8/geP
 uHz+s3Sr6jXT+Um8X4JaYBEeK0OsQOL9afDLdpA0IpYSgYQswqfzjwTJXeJS4xJIUczGStI2TGg
 iWE3U4gU1IqicUZUSoVO2ZfLQ2TUBfu86QVAXExQupTz4Ssst4TOQ2g8rZ25E64A8kd+LhEW39S
 CjlaUCFt0zzSdWeDvJdXH8W22tBSmaf6/FqryAEfE43QUqiKdCCKy53YXcrU17RSxpfjlBTCDxP
 bDQbQc/AgT+TUu5jDFsXSrZwpkxo/GlGco3F+U6eXF3SgLTc2KbO8+MyTjGYm2V1g09voS8k4fn
 1cWQDWz0GhD40bhyJZg==
X-Proofpoint-ORIG-GUID: 2pa04PSGpIU5ymBnQIR1tcS9hr7F-Fg_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_04,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 malwarescore=0 bulkscore=0 priorityscore=1501
 phishscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130048

On 11/9/26 1:33 AM, Stanislav Aleksandrov wrote:
> Add the device tree for the Qualcomm Halliday SoC
> (SXR2250P / Snapdragon XR2+ Gen 2).
> 
> It describes the CPUs with their idle states, cpufreq and OPP tables,
> the GIC and the PDC, the timers, SCM, SMEM, RPMh with its clocks, power
> domains and interconnects, TLMM, GCC, SPMI, the apps SMMU, USB, UFS
> with ICE, TSENS with the thermal zones and the PMU.
> 
> Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
> ---

[...]

> +		idle-states {
> +			entry-method = "psci";
> +
> +			gold_cpu_sleep_0: cpu-sleep-0-0 {
> +				compatible = "arm,idle-state";
> +				idle-state-name = "gold-power-collapse";
> +				entry-latency-us = <400>;
> +				exit-latency-us = <1400>;
> +				min-residency-us = <2207>;
> +				local-timer-stop;
> +				arm,psci-suspend-param = <0x40000003>;

Please add the other idle states (D4 and E3) from the downstream
devicetree and match the order of properties (psci-suspend param)
to glymur.dtsi

[...]


> +		usb_1: usb@a600000 {
> +			compatible = "qcom,halliday-dwc3", "qcom,snps-dwc3";
> +			reg = <0 0x0a600000 0 0xfc100>;

Please use '0x0' for zeroes in reg values

[...]


> +		spmi_bus: spmi@c400000 {
> +			compatible = "qcom,spmi-pmic-arb";
> +			reg = <0 0x0c400000 0 0x3000>,
> +			      <0 0x0c500000 0 0x400000>,
> +			      <0 0x0c440000 0 0x80000>,
> +			      <0 0x0c4c0000 0 0x20000>,
> +			      <0 0x0c42d000 0 0x4000>;
> +			reg-names = "core", "chnls", "obsrvr", "intr", "cnfg";

Let's break up such long lists into one-a-line

Otherwise lgtm, very nice!

Konrad
