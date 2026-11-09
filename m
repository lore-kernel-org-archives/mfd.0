Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794205012;
	b=cM06p2f60e5yPBQTS98hWMxRtANsN+72RkcRgGe0SL9DtwAzAzX1OwEh32OHRNCxFFiJ
	 pRJExLso9Aae5KHK5sukrsykzRnD4JaBvk24U0fnFzm3G5SKiQQGGh9N2IfnifV7oPcyd
	 DsoWVacxIV2Mevst5CZjfivRB4ICBzIKQE13s0gfaVe4UsNFSryOc+eMu/fjeu6uKdBOt
	 11zoFca2lcyxDHtEBqXBrxcpVC8JzUUqIIIEvYTFu4kzAIBPKoRVpBr8rvStw12yHm+cm
	 ZY79pdwi3MVK16wQLg6f14NyXUiCWLZVRxl4o+5ouBYEMx0L49QXkZSEh40IusGPtDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794205012;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=cRAQkVtgtzRsRrlx7QmFdwSLIDpCPX6KG4k8hKPINjc=;
	b=mMoeFZGaTQgyo/aMCNJTiq/WTTbX2wwtJn2iBcPVsOzxMZNmwQ1DehSjJ/hMVYs5laj0
	 4amn46PtH26+MOvv9nIs4zav0mWWtzmQzJdWR+728A3fq659vI2SL+txTdYipS6tzepTU
	 nDz4/aFG/t7XeEpy3+bIuRIf6MC48/rSD+GSsrUKQVM5YwRdBp9zQGDA8odvw6fmrlXgF
	 LyaMlOg1lRN50JQ2gKTSmMdUmPqGI//5SldOk5hPZC1w1gAEf0jUnOugtVnhSMTfsfeXC
	 +tq6ZjyUkKo/dw60z8nVgoOVRHxdT4ZMzSrEQtOJF141yxdq2Bpo38fR1E6+0MIwunA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="aJZAU/cJ";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=J2Hu8pv2;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFC5A606A330
	for <mfd@lists.linux.dev>; Mon,  9 Nov 2026 06:16:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DFC5A606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aJZAU/cJ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=J2Hu8pv2
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A969xBj055799
	for <mfd@lists.linux.dev>; Mon, 9 Nov 2026 06:16:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cRAQkVtgtzRsRrlx7QmFdwSLIDpCPX6KG4k8hKPINjc=; b=aJZAU/cJ6TWZuKLr
	Zip/P8OdrnyaaE/rZN2lzz10nS1RJaMxos1LhPFXJruZoUkjTv4OUEgGKcAWp3zx
	7/kgTrzEkiPEHIKneLMO0iGNrVn64Z9t1OTNIDix0U22A/oGD1JNRd4HAUuxiipY
	1zo3fc5n6YoSZ/8yHfCkMn3dI6Nz5T/VKh3fcwo/IumTnNXZIvnQTl8DN4OyRVMU
	jhFnGYEgQAvh61/9kZMlIXBocx1J+TsFKfRU6rNtGhgZZdzjQ/5gRSQWexHG3F6n
	yIUlIkyepxGuDo7oHAPa1GWYncOQsHUrfZQwrkQtJAAqg5s8VgeCBfWL2DB5TpaZ
	3EJBcQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4htuqm1uk3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Mon, 09 Nov 2026 06:16:50 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36f26e6abe9so1110629eec.0
        for <mfd@lists.linux.dev>; Sun, 08 Nov 2026 22:16:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794205010; x=1794809810; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cRAQkVtgtzRsRrlx7QmFdwSLIDpCPX6KG4k8hKPINjc=;
        b=J2Hu8pv2sHB6eqfw/XZ9zr0xWxLs3iPuCTa4Mz3dCkkeG8zfzhQ4AFWAJJXzSZ8YdY
         FQkUI+z8tz1uBMKZxOg9MMm7cE29x6SStj/dDoFtH1lU233Tym5vPsncvF0GtbW7YrIW
         KtcuaOX6dQQ1ZRgQV4Lp1sjFb5rGyIJFoc8tyOyUr/3EtxBV8qtLGE9ZPkgRLIrNmT05
         Jvh4btcMeIaxg1uJX+4zB06odiWPqtA8lXuogb6pLEhGGciQKg24UzymZttv2oZK/Drj
         b5DWM+skoheErfPc/Pn43TwamcNEDP/3kwJaJrNn1WfZ0BtD8TKsaEuDszAwFwSd6OaM
         1R8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794205010; x=1794809810;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cRAQkVtgtzRsRrlx7QmFdwSLIDpCPX6KG4k8hKPINjc=;
        b=JBRLweMgRIZwRJ9JEbWHe2ZgWydOnkeNJ2SD2dYK/GUBUenJ75VdYIZqz3pPKI4P5D
         XNep0YjvcU0Ie26vgZ8f9pwUQ9xiZzTdm3Dn8mbuaumwQRdQFaMBfFSVyLWAvoZyMPVV
         c3kVMEvbvH1j6poxllO6V3Gd4qK/A0iE65fWvmrjQpD5XQMoCKElGnzCfu/I6lGKb5Z/
         GWm/nC5g5XZi1W2fbpG6p4N3nh6B+zgKhxJxPs11VsCs4NcmqhkI84vDCCx+9m9D/zZb
         IPS5CwtkXRxNsWVtNJYoBE414Ko4Um6raEK4HvMsbkkAUy6kAfKfzhE3sQWays/9pGqS
         rWFw==
X-Forwarded-Encrypted: i=1; AL+hErGO0p+DUA+uGlpvd25/OmSnrYLgex4XVp88VA/JhIFND79laX01f2lr/oIXwN6d0a8SOi0=@lists.linux.dev
X-Gm-Message-State: APuU4Z9BaANmCj61QpUdi4shgx7kgVKlfmI8r+QMVS0509UhauymNUV4
	8dwvxHXrsv4N5rj68LS5DdMXT6gRG6hfS7nTVl8SG5hDvc3APXTBPpsJ6Il90wD0Upj21a1W4iH
	gYE2Cv9TwK/Lst2Akd0dmtoIxE2n4+UbwMgt0Ym52drZO1+4jmXX6OoQ=
X-Gm-Gg: AYBFou3AVpPLqmDhqReRY0skdOwhtJsEvqsc2C6HATH087wC9GMZW+KfeFKvmM2lYG1
	kdV7QaG30ANOfvmhdo4EHDWYf/dNkmvG080iqKgN3XZ+QjoKJRmgeJK/Fh4KT3eMo4xngDfA/FD
	e7mRplaQ2u1KmBEItTQ1YTCoQWHyJMyeeRR5lhtPNJ25iy7xCWU585xKsaKTcrC3Si8MC34qHp4
	HcBH6M9Msv/ee3l4VTotZcawPRvCqZDOEVJEt5WpfPXmaqB4j4aMsDh2yM2ChORPGkeGejCacdO
	1xb+Xs7SCFhsKZFn3Xde1zfTu6h2Gyi73f9cO4TRcv79QbtRTsEb80O+09F22r58kk9inizm9EO
	YQ77MB28mLJ9ZFIc1cZINSek+H5boueGkL7e/Z75fRMdQ5IzuFI5BdZl0LCJSilPSxkc0vyWH43
	tJ
X-Received: by 2002:a05:701b:241c:b0:160:90a3:ca8c with SMTP id a92af1059eb24-1b39fec1741mr4984672c88.7.1794205009718;
        Sun, 08 Nov 2026 22:16:49 -0800 (PST)
X-Received: by 2002:a05:701b:241c:b0:160:90a3:ca8c with SMTP id a92af1059eb24-1b39fec1741mr4984627c88.7.1794205009090;
        Sun, 08 Nov 2026 22:16:49 -0800 (PST)
Received: from [10.218.7.34] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3771fa200sm9996618c88.22.2026.11.08.22.16.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Nov 2026 22:16:48 -0800 (PST)
Message-ID: <a9ba8ca9-f93d-4a55-9e5e-966121b102bb@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 11:46:41 +0530
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
Subject: Re: [PATCH v3 3/7] regulator: pm8008: Add mode voting support for
 PM8010
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Lee Jones
 <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, mfd@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dhruvin Rajpura <drajpura@qti.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Oleg Keri <okerixx@gmail.com>, Burke Cates <burke.cates@gmail.com>
References: <20261030-pm8010_i2c_support-v3-0-995ed1ec7a72@oss.qualcomm.com>
 <20261030-pm8010_i2c_support-v3-3-995ed1ec7a72@oss.qualcomm.com>
 <216ffb94-864e-406b-a844-4435b8ca47a1@oss.qualcomm.com>
Content-Language: en-US
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
In-Reply-To: <216ffb94-864e-406b-a844-4435b8ca47a1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDAyNCBTYWx0ZWRfXwqSse9VKP1+4
 L3NIev9u6kNs58Os2jpUC6Q7Wpl4o/79bjj1Xm3QuofzuZ5gG8+FmI7ACTSA3E/SpGNlMlUtsvA
 EcTSVSDIj8HOs1rzDVAKnHqlWETFt4Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDAyNCBTYWx0ZWRfX9NQyTYtgP3tj
 Z8MchG2os663ks01GgMEk3RzSYPAq/s70Fzg9TgAco7zR+vjxO8/CxNthFMmyG7o8IvvREm7W5w
 I28q42ygwCd4Z9tbDITZ7Z4i2cp7vWFRxbWjSlKNHaNKo/tbAL76Vzgq7bzCqm9PEd6wxLl/5lh
 d3RKr1COhdMLokhaId9c+QoT2bofDAYboAzUUCc0weFo4C+xKY7Rtd1OdkURxqjnXq7cRdkXKw1
 aw8Bcypj5DBPVXZcdLm+pZGneP43MhGjevoVQgP7VrwTX3lBmoy/Fdqzxp+8KzXU7Kc+9XnC1iw
 RlbnTTpcZPSLUzRMmzsnVRClZuLjkKgGFnMDsVO8OhBwXQuRPtUSoGAvF7Wlc+5Ux+zpDB7XkCF
 vKwJCYJ750Nw9crUNi3NREpT0+BJoHBxPxGV2vgF/hLRjyth/yP3DcshhQ4GvjY89uQWsuJh6bL
 SLbrpYAppYDn/otKHeQ==
X-Authority-Analysis: v=2.4 cv=JLquIMKb c=1 sm=1 tr=0 ts=6af16552 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=8zo3re30kI2txGzbV-0A:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: CxTKBM-gdXcj3MU7qyKBCFunDXFbdv4Q
X-Proofpoint-ORIG-GUID: CxTKBM-gdXcj3MU7qyKBCFunDXFbdv4Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0 impostorscore=0
 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090024

Hi Konrad,

On 11/2/2026 5:40 PM, Konrad Dybcio wrote:
> On 10/30/26 7:20 AM, Jishnu Prakash wrote:
>> From: Dhruvin Rajpura <drajpura@qti.qualcomm.com>
>>
>> Implement set_mode/get_mode support for PM8010 LDOs using the mode
>> control and status registers to allow clients to vote for LDO modes.
>> Mode voting is not supported in the PM8008 LDOs.
>>
>> Signed-off-by: Dhruvin Rajpura <drajpura@qti.qualcomm.com>
>> Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
>> ---
> 
> This defers the modesetting to the consumer. Please take a look at
> the qcom-rpmh-regulator driver and implement something like this:
> 
> static unsigned int rpmh_regulator_vrm_get_optimum_mode(
>         struct regulator_dev *rdev, int input_uV, int output_uV, int load_uA)
> {
>         struct rpmh_vreg *vreg = rdev_get_drvdata(rdev);
> 
>         if (load_uA >= vreg->hw_data->hpm_min_load_uA)
>                 return REGULATOR_MODE_NORMAL;
>         else
>                 return REGULATOR_MODE_IDLE;
> }
> 
> and fill out the max current allowed for LPM for each regulator

Yes, I'll be making this change in the next patch version.

Thanks,
Jishnu

> 
> Konrad

