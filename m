Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 920C74E4C2B
	for <mfd@lists.linux.dev>; Mon, 19 Oct 2026 11:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792410491; cv=none; b=qDvgane9qGlxwgwbzGR6yAzbdow235wuUfKitsuwhPIscgkT9xbr3TnECUFU9xoEDDjPY2tqtW80vaatcH7ZakB1b94OSqhWjOaVx9BVw2tNFiImq3j4VVWk8aGUJba+4S9P4fM0SfE43K1sd6wCoqy6ht0drJTd7beJFwgH2Tw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792410491; c=relaxed/simple;
	bh=K/8pAO/eAzqZ4mYJnQheLP+ihujFn34TwXLo1Fv1AhQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gkerpshLDSoUgSlwp7SGJGhXwTN7CRVGcM8e9VAzU9OAEKOyYT8+nwrfkYh/DuMLCRkyzGm4XeC29HuNG4STJQhnFwfu8DCwX7zqewUcYLn3XlrUo/2ga8NPZb/EHnLvIrFrgNH4cbXeEQsDq8Wov2IOtpXGROmPRolcHKdA2fk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BVLQgX2G; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WO8/4ggO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BVLQgX2G";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WO8/4ggO"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J8P0W62041862
	for <mfd@lists.linux.dev>; Mon, 19 Oct 2026 11:48:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1IVpmXKjPqO0ciTUQvydqlwZmfEo3zdqJh9QY38OJqM=; b=BVLQgX2G4+5ibb5z
	naNpvmFbebPYybUNIVsEbdMOcPaQtWO0TZQgPPkuEM5Oe2Flb0vJqGsT3qQPjNev
	fIFxxMJtYJ0YTRcICEBq1Um5HlLABsEAT88Rk5c/h7PMzBvVnaJvhmK4acvnE+Rb
	hDz5F04hTez5KuKKe0jQMfpG0+uprWJnuyKyxxql+riWqDem/iIv1lMAYCCezd8f
	rCyxZOcQzaXomi0jNI+/Bi1HnHRUQqZMshj29rnCENYK+o5lQfQmqaU3T9CTrDcn
	xC3LRGegAvzRjHTZeRvYPxJYn3UGQFVvn9N6R/vWBv5Q9YYMWdGzx9BwNPGmArHA
	i9FN/g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hd5ur2huv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Mon, 19 Oct 2026 11:48:09 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93e629c7b16so35315285a.1
        for <mfd@lists.linux.dev>; Mon, 19 Oct 2026 04:48:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792410489; x=1793015289; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1IVpmXKjPqO0ciTUQvydqlwZmfEo3zdqJh9QY38OJqM=;
        b=WO8/4ggOQ4dcgzkj8FCbDXN6xFcSf7G0frKRQbfTcTHKgkDmZdGjwjgUVW3lmNK6/b
         wkotuBFDWsu2GLAJOdhy62rPSp7csgUijm6PjZdPi6Gd0Ax+tE8VzuVFZ8r2vQlFnSh0
         eWXgQ9IHtgVLKT17GKIY/CAP0aXMGxPv6OKXCVxfKXzV2y1DE29C/MQqRnWgt/Wn3sam
         CZYUN8ssvTi78ouJ8PspqnbFf2edvA3XiWl7v9e7PDi/ksJ80ei0A6eq+md8vUy91O2f
         cuGPlIglbYXMIXQUdMZ9fJrPjR+CXMqQiXCksV7tjbK49Nr5qM24Z8V398vVsAcr2hkm
         LkZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792410489; x=1793015289;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1IVpmXKjPqO0ciTUQvydqlwZmfEo3zdqJh9QY38OJqM=;
        b=HxtV1MetK9ow4Xby3vOGua8AHsXfQn4HRGOMvYnPkOMMSRw9rike8l57Cf5uKI7VCw
         ksK7bRN+RpKXDPzpopq/Z42gU5YddcKJIHvxas7FONK1Y9NBSqYfO64LKMlucVcp+6t3
         LyuWfKfN1+bJ7jzkD5oCTY7eY04KDrmRqipU8m3WxFUd8LYPRgD0M56AmO8JJ5YPL6N7
         GLs+JNe0Aeqw8yVnMQCCicxJxwMRx/QP8ezvxoLq2my3j/7KuVZVZPrWsfUO7Yu0hEyH
         EvRPjGNe/QPCQRMqe/IF2zoG9gVvSVDbeEUcNgmKeALAMED1oZ0ekP9qYh1GIkFXIMwv
         fYeA==
X-Forwarded-Encrypted: i=1; AKwUvByimjuLHRg+UZbhJZfi5c67c2eiELaWClc7xJ4Dvi85jkTKweMdxOrDAjRU3HDJTWV6y7A=@lists.linux.dev
X-Gm-Message-State: AFq9FYKYJ0RLd0LtaMjpFF/dADMxsob0FjfFyh5YoRsXPkqjoNGFnxHd
	TyXH+9H1spORJYiqBSP0n9mGA9w7Uf5m7nxVOC3RS27XhbS2Rft5gNUIyjgcDfq3nZZQkMOBaES
	F9jDDAPIjabJlMbMoXjO4LEnXNBvSC78qiz+e3iFcUdTiE8Z7Wh5CgFQ=
X-Gm-Gg: AYBFou0+FmWzf/LfccOhVGW0TWgKB/yMa05/Wv0NTjdRAvuqEThYdkCCL0Ckc/7IUNt
	8Qk4hll4Uv8e2zI2EPHWWGGjUKX33Zq9ZwY4rMwHAOn9SvkPJw1PERP2usFfHRe22tLzXAV6t2U
	pcI+TIxuzPeBacFYORNlZYsA6y4c8kEkk5delR7mukLPuXP2M6lB2o39QkWSN+Q+jTEmjyHqKKl
	oxCffc3tCzeCG7LF8Fm7j8wlt286YRPihK/9PedUX40SoGViyeST5RiTlb9Mfl+TlM3r8jfpdyi
	N/Qlhcpd3TqvQDHaJyOfwQ5JN/IeozXj3nzAQ/CayZDlqVeUIZWC8c3vGTEGMdQJdiF0Lrwcc9P
	jlPYS1VU9Uo1uBykzONSzlw==
X-Received: by 2002:a05:620a:6192:b0:939:9ef4:79eb with SMTP id af79cd13be357-93f29e50356mr1367152185a.6.1792410488803;
        Mon, 19 Oct 2026 04:48:08 -0700 (PDT)
X-Received: by 2002:a05:620a:6192:b0:939:9ef4:79eb with SMTP id af79cd13be357-93f29e50356mr1367147685a.6.1792410488269;
        Mon, 19 Oct 2026 04:48:08 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4090dceb9dsm347362766b.24.2026.10.19.04.48.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 04:48:07 -0700 (PDT)
Message-ID: <2f63cf93-acae-471c-990a-c844185a9db4@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 13:48:03 +0200
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/8] arm64: dts: qcom: pm8150l: add LCDB regulators
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>,
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
        devicetree@vger.kernel.org, mfd@lists.linux.dev
References: <20261019-sm8150-display-card-v2-0-86c05068efc5@oss.qualcomm.com>
 <20261019-sm8150-display-card-v2-5-86c05068efc5@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261019-sm8150-display-card-v2-5-86c05068efc5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA0NiBTYWx0ZWRfXwbhzVJuObLDx
 WzSkmg55Ay6YA8lH239GntF/88MRE9SoHkjz4WDF1ynb5mBiE2C2jgV17T482Qu9/PF/ZmvtqT4
 duw/PURYrHRR7zJhvYqLttLyiGf/x50=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA0NiBTYWx0ZWRfXxsJRtOg4OTre
 +9uaX/BIMfLnWXIrL4ivlifxPvVTS3nJXnf4SOKwY0mhe2iaOb9St02C0WjuCWYNdwLWWas+AQE
 yD9NDWt7VbHynLsErphO3fAAywoaM7qCyGa7uCxWqmiec0FTpLv+0nQdRXj69Awngzf1ypCLAMc
 R9ZRUJTRnt9P6WxIyxXUGYVRTRQROr5NER3Kw7UmdhcnCrQ25LVGuwEX81Qg8fPN6kYufZcmsTy
 U6Wb6EtJGOIN4qAqrT0vPFNkiywTQqhItAhlIGRRKfBdieT0Gl0n3s/yrMGDwdR6LnhdhPP58Bj
 pM+Nz+oNHthbj9867MZqFVYgRymvjffnwOL1F3v0pHxkRdsUTCdW2cW9Irk3RfD4a+f9xqT3V0w
 RA0SPt6jHdgtQ96Utdm6NNZauzAXks7Ybj7TzEDHEPeJ52SktWdWZTtuW8KoSTaKRVvZ/NFnTTY
 ayeZzNhSeBvnOy3OCxA==
X-Proofpoint-ORIG-GUID: edyHU97vQ4JTpnk49e1U_kLxJovMKgNE
X-Proofpoint-GUID: edyHU97vQ4JTpnk49e1U_kLxJovMKgNE
X-Authority-Analysis: v=2.4 cv=CP6/zhrD c=1 sm=1 tr=0 ts=6ad60379 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=R7n-rOns-cfn4W1FH0QA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190046

On 10/19/26 1:25 PM, Dmitry Baryshkov wrote:
> Describe the LCDB block providing the LCD bias rails. Leave empty
> regulator nodes, forcing board files to provide correct voltage.
> 
> Assisted-by: LLM
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
