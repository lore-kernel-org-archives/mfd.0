Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D4DD3E1D05
	for <mfd@lists.linux.dev>; Wed, 23 Sep 2026 10:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790158713; cv=none; b=QihhCj/tdilpiA6F9dWjvalxNIDDIcIWBhrExgZwsKLiTB1Oekt4DpFD+sZtfEuapyYpGa5xmadwBlB8m62iTk0oQWDczjSBib4X8EDtahb5WaeGw41Igbp5N/SHQi+EF606qC5U8xSlqRghhWZLTMNEni14IcZJYiEWlEvXA+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790158713; c=relaxed/simple;
	bh=U28DVFU357LkJoiafayvKcqMbcLV9ZAPhADRG51qCAA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HkpE6DJx3/J4UharoRrQAYQBL31yEH80StPeKq0RLeeGJw28Q1PSmmgzPFT8Fr4DibW4Gntep9btUH/Rhk46o7P+qSlmcG/YOoU20mpncUxuKK/vE52nCicbouTcd2DeiBODMZAdFYNPt9q6SFa/8fGfUjTPflCGMdXHXTFyWWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Nh+FiLXs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UbRjHD8H; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Nh+FiLXs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UbRjHD8H"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NA2cAu2236729
	for <mfd@lists.linux.dev>; Wed, 23 Sep 2026 10:18:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZdMQErsMoZLbknktARtbpxGeoP2NWqi+elqKiSGB658=; b=Nh+FiLXs6FR41Ayi
	7Tu44a4M8Qw6KFvvGUtrajB4Qn0m75ToNai1stP56mKuVbC1iih/RquBW8aUglYD
	gJbbvvCY9GVOt96zIS7csnc1ARWlg3UDJw1GrKOO3dR0EX6R8rMvLbNTyBg/+jZc
	8eyYY4z+Rl31mxVC+qulvdMEo5c1+lpqmtD86TIRL37j2Je21Z3jCuqOo6exH1hR
	r7n3XKA/DCNyZn6VJr/6/dsiTDGrZcVj3AnzDkeNd3PgLqzINc0gwKST1SdVkJnw
	MZQMNvb2m7TMGgfVsneWA/744Xl+TFD5gKgJLRmRf75fJ797pSctNNe4UwQeXNN/
	x1VHKQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvbx7g9f2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Wed, 23 Sep 2026 10:18:24 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-32b8c2b30c4so1097248eec.1
        for <mfd@lists.linux.dev>; Wed, 23 Sep 2026 03:18:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790158703; x=1790763503; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZdMQErsMoZLbknktARtbpxGeoP2NWqi+elqKiSGB658=;
        b=UbRjHD8HBfTjriagtKC9mLRfe5nbGAJCkaE4r6sHVSuoX1TOdqiGErYsjuW8NPcR5B
         Fw5mfGEZjkgLje+uhTN/3Q4CLzvD83Qi4dBM/2b6nCKiY2wAnYodZyUeQeEv6AXXzm7/
         FtuxZDLNypo1IwL7OksLBszRoLJ43sUuVZBEId17KOxGNG/wBWdfB34L5omihme0xMvZ
         22PrCiTRS15WwhPUvcRmotgflY7uwRB45DZDImK8Vkmv4SKIpumPh5ElL7aRWeMrPcZ4
         ZrWXxvuYLLF4FLg+E9xwZpqhgJxtV+8+ueDohNkGIvN2SYarkXLfK7c81BxUxSU1SOsW
         pkVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790158703; x=1790763503;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZdMQErsMoZLbknktARtbpxGeoP2NWqi+elqKiSGB658=;
        b=HTmNiq2mUmBLyhF9Clej5JLp+STUcGYBEX//ulpTESo9OOI7fP6Mn2Qaw8b+l683BU
         NKryAbRc9pttMLnWptrtmGjwDxMzHPlx7YAsrBAdxkIOcJwX8aJ/+Qv443TcEN2UJo/W
         2iOtQqRv/re6cdSYfRop9V5XIYIqpAMdyXvoWeiIOnTSwLBRiActyJCV88jzCvlkXANQ
         LV1jk167MErdUdWI3jzW+jWH3pMfe9rWtayzbJNczfvMipglRHG6J/P+HxpQfiPvuuXD
         Z3LBNIdt/PR/dx5cMFcquiWzKz+WPH8qZG07PZKzlDIzWH11Fw0LG+QrjQeuPzV4s4rW
         5P7Q==
X-Forwarded-Encrypted: i=1; AKwUvBzNFWL8EGoOv6Ss7ov1s3PD7AABbhneafv4M14yT6+YcncbU/WGDGtCkErKtsuhG3ak+ls=@lists.linux.dev
X-Gm-Message-State: AFuF++lIct8WnaQM57TpF/DEkDO1YzUM4sLoyn6288cffBDHPuBylSEb
	wOGc052ZZ0qLP3K1ajeX95PXz0+teryDOnYVKlLzCY5CVVAkHrrY19jzkPJwwppTfwCYs/hiHvY
	+ae5y8KuaBpn8nAzNySQfwGF2KU0B1+PymXQ3AQ2H6HVi0Gx33npGSio=
X-Gm-Gg: AYBFou0hH3JYCeibuFNw+h3K+GTXibV8NXYp5IWGYpyU5BYKT2z3IIO8Ezo4V6AzzAI
	0pH+Vbdv7iT4zdDMi9rQTyJ+8bMV/jPen6gQow5sM41m5pAr1T9msz/+r6bhgeejWO+3S+TE7pE
	g3RoJcyuNtYxcni96/Bo2G9n5tpDr6aj4Vt6oUZ4LhsRxLXUbJKJH6ZPmR612iJ96EDJQznEa+6
	C4sOMeJILKCpwbOvEAYA6xreTfzrH9q/btVeGO4JjZQruChV2kU0ejz+3JyAN4Yz/qAc+HMmWSF
	f8sSENFfey/p+P5SxG1+RTPRvoe8elOWqlgx6tqyT9xeCh1yUBCXxq8pM+zsic80r6Ufx93Di84
	VqyOXj+Y5H6st8mMN2XqkK/xknwsc
X-Received: by 2002:a05:693c:801c:b0:33b:ef1f:14b9 with SMTP id 5a478bee46e88-33e8c250524mr2546669eec.15.1790158703499;
        Wed, 23 Sep 2026 03:18:23 -0700 (PDT)
X-Received: by 2002:a05:693c:801c:b0:33b:ef1f:14b9 with SMTP id 5a478bee46e88-33e8c250524mr2546631eec.15.1790158702865;
        Wed, 23 Sep 2026 03:18:22 -0700 (PDT)
Received: from [10.218.7.34] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e95c7c23asm5038225eec.6.2026.09.23.03.18.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 03:18:22 -0700 (PDT)
Message-ID: <49dfb307-8d12-4008-8e1d-63d35ffb50b3@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 15:48:15 +0530
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] mfd: qcom-pm8008: Add PM8010 support
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
        Oleg Keri <okerixx@gmail.com>
References: <20260918-pm8010_i2c_support-v1-0-de33d78fad9d@oss.qualcomm.com>
 <20260918-pm8010_i2c_support-v1-4-de33d78fad9d@oss.qualcomm.com>
 <90d203ad-525c-44dc-83d6-1548b42c131d@oss.qualcomm.com>
Content-Language: en-US
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
In-Reply-To: <90d203ad-525c-44dc-83d6-1548b42c131d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: m_Um6zj7Pz3pFspJbwRBdlZWkpZf8spQ
X-Authority-Analysis: v=2.4 cv=J4s/fwnS c=1 sm=1 tr=0 ts=6ab3a770 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=jxTK5DOZuom5vZOH12gA:9 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA0MCBTYWx0ZWRfX1l7UEErYpeqV
 e1+W88cHWh8E2oX7qy/OfUMt3aSh6Lx4MvwDBANhK7uvu3s5o3iGUFv1Daii/X+CpHFJUWenaqj
 B7Sv9Kx9RE1oZuN89+nIY6qLtDoR67pgCic+UV6iCCj8ed1I6zOT/p3gJ+fFlYxGA1XdknTXfDS
 uKlNJDAwA1JFGXo5vQc950PUSgRECR5aeezbcjZ8xAfeWdg5ArpG1pJdkVFmJEQgpaX2q29LGtm
 Hhuy5rm+haZsUxdLH7XhvbD1biwB2n+4tMV4SrEh3aAZ/ncIQUF42yJC52aTqGe9PFBJ2h4Xh6X
 DOWLWkl2fIAc+Twvw2G1QiHlOkaNSa/g++NR+8vNoKudbvNCtYnXQJ3Ag10JfdRANppMO/L1ms+
 en7lVYCSmEoyrzKoQ9oY6GgPHuTyXrKy7VbPTKRFNxqNUsWsmRWRQRa9NtCOg3iDk98+YzSaKbv
 Z6JAPohoe5cG0+NXVNA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA0MCBTYWx0ZWRfX3AJ2ntE6qVPr
 RQXmhBvL159lGve9gU4EX2mwc73JbZa8Fwcg4t8ZJz4GUEK63oUvvZBHtBXSlunUZ1h2WexQZUV
 Y3nCJ2kmDL35NIWlHvsuuH6nrz0eXwI=
X-Proofpoint-GUID: m_Um6zj7Pz3pFspJbwRBdlZWkpZf8spQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 spamscore=0 impostorscore=0 priorityscore=1501
 phishscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230040

On 9/21/2026 7:03 PM, Konrad Dybcio wrote:
> On 9/18/26 6:42 PM, Jishnu Prakash wrote:

...

>>
>> diff --git a/drivers/mfd/qcom-pm8008.c b/drivers/mfd/qcom-pm8008.c
>> index 60204cc9a2dc..ed656f0d6df2 100644
>> --- a/drivers/mfd/qcom-pm8008.c
>> +++ b/drivers/mfd/qcom-pm8008.c
>> @@ -34,6 +34,7 @@ enum {
>>  	PM8008_GPIO1,
>>  	PM8008_GPIO2,
>>  	PM8008_NUM_PERIPHS,
>> +	PM8010_NUM_PERIPHS = 2,
>>  };
> 
> diff --git a/drivers/mfd/qcom-pm8008.c b/drivers/mfd/qcom-pm8008.c
> index 8408d045e754..84c2d50545af 100644
> --- a/drivers/mfd/qcom-pm8008.c
> +++ b/drivers/mfd/qcom-pm8008.c
> @@ -35,7 +35,9 @@
>  enum {
>         PM8008_MISC,
>         PM8008_TEMP_ALARM,
> -       PM8008_GPIO1,
> +       /* The GPIOs on PM8010 are fixed-function */
> +       PM8010_NUM_PERIPHS,
> +       PM8008_GPIO1 = PM8010_NUM_PERIPHS,
>         PM8008_GPIO2,
>         PM8008_NUM_PERIPHS,
> 
> 
> or drop the GPIO support altogether, if we conclude that they are
> fixed-function on PM8008 too (I couldn't find clear info)
> 

Hi Konrad,

From what I could see in the relevant HW documents, the GPIO
functions are fixed on both PM8008 and PM8010, so it would
be best to drop it from the driver. I can a separate fix
change for this.

Do you think we also need to make binding and DT changes
for dropping this GPIO support?

Thanks,
Jishnu

> Konrad

