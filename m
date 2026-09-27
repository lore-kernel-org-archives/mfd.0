Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 124914156DA
	for <mfd@lists.linux.dev>; Sun, 27 Sep 2026 16:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790526823; cv=none; b=KDfCkWjBLaoTqwPpM39EbGdnIeNIcDotI3ScRMqI3tY4I4tGxSA0tNIU2p5hCu1n1w02IUMxEUdAr8/q8jEXOc6RUwEYmYKyOUiyVvU9HTyWfgiqKwFJklZY2s6TOc+fUHJZHTKRUdsnX0IXXugvnl/zn9CMALkrPHOBrVEEHrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790526823; c=relaxed/simple;
	bh=xGlbAsXAOE8rH+2A5jMDhH2JAdQcuVK+CGw16Ag4g3w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fp1g3wAtKUDhhiKpvNoWAm6eG017b6Lhlgw/a2bok0MhSdXtRTfhg23yqYZlBCfpeLl6LTdFX5WkW87Y3lf0fUyvJaa+JETuQbZvzjfz2wZfuCsrNNLdJpdbHVuo0pW95vR5kQKNbJxz47zFZC5+yV6YMC8dHPi5XCisjfKurQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EN/ib10L; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UFQBaRic; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EN/ib10L";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UFQBaRic"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68QMkOrI2148208
	for <mfd@lists.linux.dev>; Sun, 27 Sep 2026 16:33:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=kBaOyYV1iWR4jpfFBZ3VawI9
	vIbejaQgOQsY1cvSmjY=; b=EN/ib10LX8Y/+lkH0LFd8Jk09MJQN+CIC0e7m+uf
	SFjv96uGdqB/t/rKCAY44aGZobz57ViFMvRnVljBHQPa9qd1lHKiYuXvfhaqGAnH
	H92h5WAYp5cigEofp8/jBwuvtbpKRFddGeaCvseffvOiUEtKXC8uS6cPUNmPD7WF
	/BVSAi27/TO/jOfutRTKml2kn7amU4nYxvTg8i8Xa3nxxQlozuSAiYgy/sWmUAxD
	/4drmk0V+Ith/qcM7lQeW0TtVrZqZIQ/jn2l2MAZf3o0CQsKbD90B5+p+VmHrund
	F0ME9KJN4BafMYiviDoi8ZgU1f4tRmUJ33kUeWMiI1rxkQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gx3rfum6k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Sun, 27 Sep 2026 16:33:39 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93909014c85so487183285a.0
        for <mfd@lists.linux.dev>; Sun, 27 Sep 2026 09:33:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790526818; x=1791131618; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kBaOyYV1iWR4jpfFBZ3VawI9vIbejaQgOQsY1cvSmjY=;
        b=UFQBaRicYpT+jxR17HqRvvQDVDLNAe8yArrZ5vfKtOWw/ZqCofeWVHUk7VYA1FZTzA
         cLRMPWX1sGQpX1yv8dIqgrCmTyKzqmsL5zukWSuPiFM4KKNr2R3L4hdwcEokEt1fNZRe
         fgGayzaeKc6DIRzWZOBEA50tyiyGj9RzpGxga9tQ0r19S80L7YS7veePhDA68my64bqj
         Vpoq36DYe5dgbLO7HKttBqWGOAhap6JoHw9cnJsM3CewWQ+oJzzNHnwqddTnQkjErIK2
         XoaIZstrtvTc2I54RRngzjVOdseq7N1SqVdomjS7C4CHf/OWbVWeHHG0Ph/vqHC1zUyM
         2/uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790526818; x=1791131618;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kBaOyYV1iWR4jpfFBZ3VawI9vIbejaQgOQsY1cvSmjY=;
        b=SJOqQQe8wqTG07T8e2XZCU0J56bXhgWVk3N+wM12f3t9XOFcF611c6FnxOXhNXUGYo
         BjAKe16RC4UywmIfQMXW342BvtcKWVvPWoII9x7nUz5KZZyAC8EbJ0eNLkf0tzKC1FI+
         OPS9FrN54qc8i+f98sIIOGTjNhWR8ldQw6bLwdOY+97/9sttr7Zvq5TFR0u6e31ozbqY
         D8xbwnNWNR79vIJUyWN4+DFPSuGI96hpdUwonQEwhHEgUahrJox/3Rqa9fLNckPGkQZ5
         +Wg26+qWQyTwl+NOXoTSgmr7t3ZWDrKrqWSIR0KQpsUryU3UvBoDg38moDvhbgbgLbVg
         NBcA==
X-Forwarded-Encrypted: i=1; AKwUvBx3Q7pYIkhpnp89J4aAEhhe3/pJ1w0ydZ3MwAzW8evvK2Y6AegZ/CJQUUDtkwkrOlywUKE=@lists.linux.dev
X-Gm-Message-State: AFuF++lEdLU3z5vXJcrTP11KrjaXugEx4jKq/HcVdfMOzETUHYSDcsGQ
	DBdiMFtttW761jnM1dwvvVrFvharkwCr5FXEvOAVtsb6tt9MBFzaU3VMtMKsHcqOdYIVOcoKGnf
	43KkDxWqrmymh+N7gD9obsBZZzdSS/UJoTe3q6TJqC26vCDh4JIRpVOg=
X-Gm-Gg: AYBFou2l55XF8D559C2WVugkeCp60w2kg1xaBfmt/PQI886+mUbYgvGR5QJ0JCjQtb5
	iIVdNKSJ3S1lG9Fgyh0PiIoHmYFQ5FIVYWrWaC1zFeh1dEmPWhV/VBEvHZIsBhv7/oloEPO+aek
	l0l0axEy26Heb5pUqWTwKfEuD5PNFpJAZ1ITuC73ZKawbrb0AHxsZM9hmnkYYVVBujub4DYalPt
	z6DtBGebKjAZxwBJtlOAo1rQ7/m+RFIz62YdHFCaPHIsgVeAhCyBTSliYRNvtIn57upUcjIh55G
	KNI3Vhr9xHxBC0pIMEhL+vdyDc0pcNlwNbPCVFktx3sGi6o/ILuwy7vC1C6qDkj1MzpclvfCKhF
	F5kveCG5M/U+3yRGlyi+DOGFXoKm+RxXKE/vXXoo5y7c2x6/ecXCOQqhoEOPn1zDqHPukhfPGFh
	xfG8hlhtTV/vMk
X-Received: by 2002:a05:620a:8001:b0:93c:735c:2477 with SMTP id af79cd13be357-93c735c28b2mr277171785a.21.1790526818109;
        Sun, 27 Sep 2026 09:33:38 -0700 (PDT)
X-Received: by 2002:a05:620a:8001:b0:93c:735c:2477 with SMTP id af79cd13be357-93c735c28b2mr277166485a.21.1790526817696;
        Sun, 27 Sep 2026 09:33:37 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8e6ae622bsm1929439e87.16.2026.09.27.09.33.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 09:33:36 -0700 (PDT)
Date: Sun, 27 Sep 2026 19:33:34 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: David Heidelberg <david@ixit.cz>
Cc: Alexey Minnekhanov <alexeymin@minlexx.ru>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Lee Jones <lee@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        phone-devel@vger.kernel.org, mfd@lists.linux.dev
Subject: Re: [PATCH RFC 00/12] Qualcomm Type-C support for 1st generation
Message-ID: <zb3s4fmwx7vu3kcqigensacbgdqoaqnipfn4ntx4dh7ahrfr42@hvdw36dqb3qn>
References: <20260926-typec-v1-0-31adc19f32c6@ixit.cz>
 <voc4ie6fcegr3thk5n6dib4pkdxmracch4hhgjdih6pxrq2bfm@lq7mx4flowqk>
 <f85cdfb7-b797-4b4b-9937-670c6dfe52c3@ixit.cz>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f85cdfb7-b797-4b4b-9937-670c6dfe52c3@ixit.cz>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI3MDA2NSBTYWx0ZWRfX3z5ZpmFDasfX
 OprPm1EQGx/slBNuHKwbDBePgs/6DvVQtiqb1rnIdf90DGURf/7AH8Q8dd1BTVYiDxR4vB5jbxH
 Ubcz19+09A75XO8GwAC0nYl6t2lScm4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI3MDA2NSBTYWx0ZWRfXzCDN6qnZGujt
 /Y8ZK4e/dBRzz324E9TKJPB4LWVB1fYP7V/O+QmN3AsfRhCG3Sd4hCExEtDolA1ZlfjP0TsFer4
 TwN4wJ3C0i1ogxOOtfT9PrKt+mwR+pk5hjImkyMouRVLA019ph7zsb+DAvAYBcz5m8JzbjSahXb
 HTw8sGqzkXYB6VdK1YLcsmMaMbBHaHzUkclaHjKyeKJhsq/nkyeOK2MPzicoadw3LbfoS7GPxxw
 EVKOqZ9NvlnR5vjFWfOmc7eVHJIp6+SOoeVFGIdoXv722tf9pduvF0GwsUI4iTIwOTSQ6A1Kx0S
 Ujjcl3RAm1F8qvBWix3hzwb2F5ppP+MqeQI6cFmw1+PTv8VLYIQsKFVdVSKU5j7CVT0QesI1xQg
 YZhi+mhDpRK/mO0LDqNeWTCme0iDmmwsSMsPBVwUMR0J9tm/R9JKaGmY4HAzXKCEhWoyg/AvVWL
 aOMLxZq8gr/P3wgacPw==
X-Proofpoint-GUID: Vz1Vsr8JaDa_Itxj5-BSMm-ufQfc9lBc
X-Proofpoint-ORIG-GUID: Vz1Vsr8JaDa_Itxj5-BSMm-ufQfc9lBc
X-Authority-Analysis: v=2.4 cv=K6G3jCWI c=1 sm=1 tr=0 ts=6ab94563 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=Ei4b4_x7BeZEOqWOIxkA:9
 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-26_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 impostorscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609270065

On Sun, Sep 27, 2026 at 05:16:28PM +0200, David Heidelberg wrote:
> On 27/09/2026 15:05, Dmitry Baryshkov wrote:
> > On Sat, Sep 26, 2026 at 02:40:19PM +0200, David Heidelberg via B4 Relay wrote:
> > > This series adds basic USB Type-C support for 1st gen devices, covering
> > > configurations that do not require VBUS power (e.g. devices using
> > > externally powered docks).
> > > 
> > > VBUS support will be added in a follow-up series after this one is merged.
> > > Supporting VBUS will likely require refactoring parts of the SMBX charger
> > > support, which is why it is not included here.
> > > 
> > > Tested with an externally powered dock station:
> > > 
> > >   - Pixel 3 / 3 XL
> > >   - SHIFT 6mq
> > >   - OnePlus 6
> > > 
> > > Tested with an additional, not-yet-included VBUS patch for non-powered
> > > devices:
> > > 
> > >   - Xiaomi Redmi Note 7
> > >   - Xiaomi Mi Pad 4
> > 
> > THis is very interesting, as it will also unblock DisplayPort support on
> > devices from those generations.
> 
> Yes, DP works with some minor adjustment there and there (going to be follow-up)
> 
> > 
> > 
> > One major comment. As we see, on SMB2 PMICs parts of the Type-C
> > functionality are provided by the charger / FG device. I guess that on
> > SMB5 PMICs we will get the same problem once somebody tries to implement
> > additional charger features. Would it make sense to rework the PMIC TCPM
> > driver to be a composite driver, taking several components via the
> > existing Linux interface?
> 
> As this gets decided from the QCOM side, I'm fine with whatever suits the
> hardware best.

Bryan, as you are a maintainer of the PMIC-TCPM? Would the use of
components be fine?

-- 
With best wishes
Dmitry
