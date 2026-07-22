Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 738BB49252E
	for <mfd@lists.linux.dev>; Wed, 22 Jul 2026 09:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784711115; cv=none; b=dLUpLBlRCx/NxadrGG7KfILEgMPhyQCv1GGBn4QQqW7GH7du7QTVEZHW3BTtvOiLInXkxX4/bsbaAaLGiErOXyxUxgOP6dcDr2dD+hdjVNwaeHAZW+zJumx0AtGXxj4SwN97dV4hR9dCrr6eC/Q/QHr9znFsoxYGKodQ0bsvUhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784711115; c=relaxed/simple;
	bh=baQJb7Ar7ZmU1hhzXFo7f1CrbqEmCoDf6IMkGA3MRCs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HHktYHRvSxV1Q1qUvAXlonQFSQvN/iVNrg6fUZAO8GH0A2onraUFcAJh9qOFN+VnofKqjvTzBIlM/Ch67VQU5oMvfs/MyrGCOPkKQac+u45i7X7tUP3OFfcBf92tuaqdRbcgAaVax61JkoLmG0Xb2lkTz68uYRJKLcZcNL+su8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Lb+Y2MtE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h1cUy70y; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Lb+Y2MtE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h1cUy70y"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M8x5Ae383754
	for <mfd@lists.linux.dev>; Wed, 22 Jul 2026 09:05:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ye0pmBSQNQpD1Ixqlj4iy6xz
	BJOLNvLjVgnEcTk9udc=; b=Lb+Y2MtEJL6mOdAV5TsbUJUb129e0wN+miUU7+Jx
	FKNDJWSplwfsPeWSA75BTsexEAgrOjgg8YE2bYUvzSLlzXEUNJVCXwUydVdYS893
	bOdOWNDMD24CoHqRbkKyJEpijqOu4bn7zvMBMriMWizf/yS6JtJy4YcagRetnnK1
	gknUkbWROgC4UKkN0FHfoH55XHKq7TXfJNJhzW639SSxUN44c2xVgDSvcEDLXlDB
	hCs2m+PgRXrJJWWXe+ORcJfN8vHz/dpE2IHrec4BVz/eTrs4SYxmJFR5yXpAhA/y
	BQNfKX8Zd9oVPNXcY8UD0aKKtfcdblHCz2wjkpuoVOdsiw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjs928fns-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Wed, 22 Jul 2026 09:05:07 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c85798977dcso15006507a12.0
        for <mfd@lists.linux.dev>; Wed, 22 Jul 2026 02:05:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784711107; x=1785315907; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ye0pmBSQNQpD1Ixqlj4iy6xzBJOLNvLjVgnEcTk9udc=;
        b=h1cUy70yJu1KFUPjzdLEO3CMTxlGSnQ14TZq8vymjhUKUCEWjIIfAQOcO/tOCelD5t
         trPxh5F22oHJHA2uO/cY3ndFgUUvYUj2zna0A6PLxBTdkqqLaM5bPTiJ/Spe6Z9XjZ2u
         vpy/qthaUMBgAM1sFHcGkq+qS0HDalYuRwfyq/TPX2DYb4Iiz8nrR5gi5QkUhmzb8Nu1
         uubGez3tPfIc31n/V+gCtgelKz84IWzxDg8uFmUF869bxVoCOXCBnK0QQBpS624h3ehD
         ysESMaUs01hK8wroRSfeCUnJ6arq4Z9SDnXZuL0ZbHc3fKAFqf327vI3gXe+hYtXWR7n
         9rZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784711107; x=1785315907;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ye0pmBSQNQpD1Ixqlj4iy6xzBJOLNvLjVgnEcTk9udc=;
        b=JGWPjmYbrN5vJDs0Yr8hcdzCUIpzK+BZvva7ECRhNXGgCgGRpYzbDj2pkPgqgIOgRp
         7mPRyy9mx0xvS3F8PAomdMwGsqhvQodV7TeG10a9tMoPFrM6yY0Z3M6/FZ4z3F998aFq
         LMPCN6or9x3RGeYKVLOdWIkBG7moHaTs3jdXGr4HGvDxSiFg+fwAV/GxB2Y2YPzlxUgY
         xeBY94DqMMUQP0swnGy3hIk9xkhRVYY/khaWVyd336Y0tklbPopgqqkyPDxOscUaGLgf
         kvGV5VWD7aRGVUnPWEKzBcKRqtMWp9V0rDgwl+ADhDuoCWJqDHGQ9ImtnylgHLLva9w1
         ErTA==
X-Forwarded-Encrypted: i=1; AHgh+Rpb2LYGpcPTVJlgRhtp/bpUqUw85tx5/OheoC/RiAIm3TwUx1wDJnBum6iIDRAwFwlYZyM=@lists.linux.dev
X-Gm-Message-State: AOJu0YyO1uw3SZ/KAMDvOozfq8dqh5+0Hs7s0tUIrsG/Vs6yWP8ET2iE
	QSPneYY3nvewxjkeibP6oxIzyMaF7EcGRhgUB+7EHJ9AOH9cpDy9SNK1gTGo45x1tJekmajB/Lf
	WTtig6+FljbT+tdMURGVQo4+y1+r1popjBTg+qU94qTtyMIfrKmnvMC0=
X-Gm-Gg: AR+sD11PST6GAjhpd3vDdYrNmfhClsjsOtN/uIhgpMTZJKNB4G/DxeOz6MaxyUAmMXI
	AOK3cd76DnYKxuhxWv0XYAreQgEkcszDQinzXjF14+IgBXUFtMUqIrm7anWeFsMe1hXOjolo1Lh
	5x5IWwWSoBq2zJ7oXpYX7qEGQ6N4oZjrQ3RWoaU508iTFZ4Es6SXQFsWMAZZ+rKrcOPOwZjzWB0
	Uo4ToJFJpvlZvYIpMVTeEPH5fCKWUp6peec6umzUmQqicaYe0jdzw67fhyFxmWIuEdh9fI6eWtA
	R/6iXLrOByeQGSn3Fa6HE8vZq3+PU64u62hTc0ljYPrIOn1E6IjVMXcxU16Eb+vdkyHjUsl+Sq4
	Tj5Ugs812xlPer55qUuPWxogV+3LJvm/82w==
X-Received: by 2002:a05:6a21:1506:b0:3b3:2703:115 with SMTP id adf61e73a8af0-3c3ad665a9fmr23634851637.16.1784711106464;
        Wed, 22 Jul 2026 02:05:06 -0700 (PDT)
X-Received: by 2002:a05:6a21:1506:b0:3b3:2703:115 with SMTP id adf61e73a8af0-3c3ad665a9fmr23634822637.16.1784711105994;
        Wed, 22 Jul 2026 02:05:05 -0700 (PDT)
Received: from hu-pkondeti-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147e1bc886sm6811568eec.26.2026.07.22.02.04.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 02:05:05 -0700 (PDT)
Date: Wed, 22 Jul 2026 14:34:54 +0530
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
Subject: Re: [PATCH v23 03/13] power: reset: reboot-mode: Add support for
 predefined reboot modes
Message-ID: <9367ec1e-d01c-489d-aa3a-fb361538331d@quicinc.com>
References: <20260714-arm-psci-system_reset2-vendor-reboots-v23-0-e7453c548c21@oss.qualcomm.com>
 <20260714-arm-psci-system_reset2-vendor-reboots-v23-3-e7453c548c21@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260714-arm-psci-system_reset2-vendor-reboots-v23-3-e7453c548c21@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDA4NCBTYWx0ZWRfX7E67/ln+6Sqf
 IWDrmDRelE4vxvdvYPO8HcohEPJJ5omFcIe5gKaTzMd6ZslE/gpKH5Svv6FektQswzWJJY2GPyl
 4DyW+tCr1QRbNeO4+HTgWLFP56684Ms=
X-Proofpoint-ORIG-GUID: wkCjPB7b1Iunaz7DoGFVD42ah1hELi1w
X-Proofpoint-GUID: wkCjPB7b1Iunaz7DoGFVD42ah1hELi1w
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDA4NCBTYWx0ZWRfX49FN9moxcoGI
 zy6jPuniO3900wPxgdv1AVLoNJqWNrqHrKhpOoyzCw8cU15Kg17EsGXmiS1quI6tbp9b6rWMJjV
 Nqej3RsQE77WC3WGjvIIAFwlEH+RDasS8/1+Ts5QtC7qdmARrLUqtaAZs96a5vly+MTs8VFMrrB
 xWz3MS5hokZwMNo1l7QMX19ZktNll4FEqvHPmmVAEE/RThcRkG36ISoulwpx3Hitw1dxuoD2lh+
 7vG3mOHWWK1TU6pjVsaVka0tnLNfvwine3AdzxZHuU01K0v4aZtiurRBQzaEH3y8TzL+NSelUSL
 WV5R9rtERQIySLsYwIq3b9gOGrc5FErEB8M1xlpYIKdQGsjMxRJhc7klfB9Lmd4ADR7zBAwQBGR
 u4pcRBmYxSeq3EELzVCgmDdNsg4w2r1A1aZDgrNxc0oSsmu260DTkO++XvOS2CnYU1MaVb41YVJ
 fvdaOnOIfZ3c0VDsr0g==
X-Authority-Analysis: v=2.4 cv=QahWeMbv c=1 sm=1 tr=0 ts=6a6087c3 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=2P-C3DqZnQur8SwEehsA:9 a=CjuIK1q_8ugA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_03,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 clxscore=1015 adultscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607220084

On Tue, Jul 14, 2026 at 10:46:31PM +0530, Shivendra Pratap wrote:
> diff --git a/include/linux/reboot-mode.h b/include/linux/reboot-mode.h
> index 34a81e4b4f95..b216c7595f7e 100644
> --- a/include/linux/reboot-mode.h
> +++ b/include/linux/reboot-mode.h
> @@ -4,18 +4,34 @@
>  
>  #include <linux/types.h>
>  
> +struct reboot_mode_entry {
> +	const char *name;
> +	u32 magic[3];
> +	int count;
> +};
> +

I see some where `count < 0` check, should not this be size_t or u32?

Thanks,
Pavan
