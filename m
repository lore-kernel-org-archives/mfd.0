Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92E8930F81A
	for <mfd@lists.linux.dev>; Mon,  7 Sep 2026 11:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788779070; cv=none; b=PIku6BA9RVDtYkY+l+BhezwCAlPYuSK2VwZvR4Av4/CCs1q1NjTff8wEiRHqxQG6ZxiJFF5cUpaUeuZkEM97sh6bwsDBgax2XucBciAjHIJTR3meSaY2uT6i+/gW4B69iN7LkDQ2NFnFSvS+mibD2LYzvk3WKCuQACa+ov0jFJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788779070; c=relaxed/simple;
	bh=38bxwPm2GMzpyUAZBJqwwwnfLv7xHTw3haohKL/4joE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LxXOdsJUNW+yk+sGs5ifZrOUfaLNuZ/R/kYM4XvGCc5x+AJtqQai+mP5HHvcUlFSuDgy5cPwojX1IKh9zArmRq2GxOwqUDrurMUtGP0foq5aXi4D90+cLz6fTjyOupCi9n3hwdjWVmoprfhhjiG3HIXxSkENUJdBE5IybM3p2rQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K3fbSxfo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fDKJy6F4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K3fbSxfo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fDKJy6F4"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687AnDLu004214
	for <mfd@lists.linux.dev>; Mon, 7 Sep 2026 11:04:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	38bxwPm2GMzpyUAZBJqwwwnfLv7xHTw3haohKL/4joE=; b=K3fbSxfohhJlMHpo
	k8uur8kfctYRGgwA02lzfNY+DAmcF8npQlO6uHHixLToICkzhA6F0t1qgMrb9BPW
	hAGm2Lq/lzwV0kre+/gTsj0PIx+LXosFAllpr8ddJ9CeN9VZt20hGeiVjGqTwGYj
	02voqwAg7M9R2NY/j/DLkRQW+kU9tIdM53I7nNaJ+rwmy8DiujBhuS0ilhIqnFlA
	lVFnC+CC4RG6CZLP6G/n18ROv++80pxZUTTJXFJnuG3HlBYHG27NP0QS5U3MuPPB
	//odSVU9DSva0EirkQKHD9mbFg2GcR29Fnhy9SCgz5YAztUk0RcMSy55YZcxbVPe
	Dj+1sg==
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com [209.85.161.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghssg0p6p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Mon, 07 Sep 2026 11:04:26 +0000 (GMT)
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-6b1b8b593a4so3465970eaf.2
        for <mfd@lists.linux.dev>; Mon, 07 Sep 2026 04:04:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788779066; x=1789383866; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=38bxwPm2GMzpyUAZBJqwwwnfLv7xHTw3haohKL/4joE=;
        b=fDKJy6F4LkAOnttOx+7cnsHqaEa5EphnkLTo7HsgJwOfUKYiTgB5fhC/7EWmsflcrh
         Cw/Z04+o1syvIs67JQNPfAVqwPNkFTXoMP7mtZzkSh4KGfTpX4xw6qAvpzRBBW3gJLaP
         Opu3sxYvlOUXEOSEIF2wnRpbjFunWQt9ml916mplYVniW+CXjKIqt2ir13RFntY15rYc
         VPJcx7TD91UNIMEQC2CCgAnXR2Xnh3jhyyHBVEoE51Gw5HTpPRWfDBZ8gO7TE03RrU1h
         dfmoqOydLWkR2Qt7QBsTrN847wJ1xLD2K43mgyYGn//siI24BsR1KzzkQoXaIcyLtCp0
         MQ6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788779066; x=1789383866;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=38bxwPm2GMzpyUAZBJqwwwnfLv7xHTw3haohKL/4joE=;
        b=mnHzIJAh0yZR9bVKiRyQ/OTUCjpZqKtcIwu5hJ4aPH8bi6SOmekoGZADJJMgFKTUCW
         IydldTp2tinyP+Rj1h08s4J/pPKPfltmXxv0bK+ZJXGAohyCeam4noBoWuApiBBFil/R
         ygHrY9X+0aqVoI3az5NibtQjnd+YW1eYVk5rx4xc1Q69HeqQMl0uj1CIaclrLXJnIdi5
         KGXC88WSv1bsTyxaeW9WdZSoPUI/QyOITeGlDmQHoeNEnvMyzwVEuYwyNub5NBw271k3
         nMccDEAwaTEXi19vZxYb9bOMbqciK24nXQNE+I3tuheQNq5mqAqIUzdYlk1mzqlDgp65
         3l2w==
X-Forwarded-Encrypted: i=1; AKwUvBx7uq8NczWaO30/B+HncJthrr+6hcqddGV2xSiPk+wzXVCNeZG/HsaihTsfRXmXEZSuIYM=@lists.linux.dev
X-Gm-Message-State: AFuF++muP7G1VhDlIgeQf5wgVFKORRvzYJey36UpEXlN7sR4tLKu5mOY
	J/5nl5G9JYj3la6ySZk8ZYpp+GfYqV0H8sHbyWjOKKt/IwaQ4xjC5lu4zHzjArV10L5ua/zB+va
	c5ZDZPUhX0rvRuNoWB/lM7TeNiD6cI/M41slXVxtmi5F/f7aNYrhdIt0=
X-Gm-Gg: AYBFou2r+zc/m2ofRFqhTAoy88cWSE83gBCP7UbSiPfnNQZ/K6RDhZc7AGnn4EsjODo
	QPZ4oCgl5axkfuE4xbBkGLyUJqYZ6sjQu6K/0EZMpWYbpcRCBbICMpOBEV3Y/3dJelEfTegY5LF
	I0MwvUmAE6Zh2OO6lMK01t+koA60cSvScPeqYTcOpTHZe9FscW9T9CMNoA6rLQW9vVkVSr07sOH
	RfluDjFVCyyNTsj5p3H4B4KWr+NQaSR9SnyoLSpedwL0E8KstyoBOgVAef+5dxKcDV78XIBPYYU
	JvPOUoimjk5Tinqc5kbLqzhODQddNzJYOnSWGHNWETYU0DKoJHCW/AB513zHyUo1Z/8kdtk9yWg
	wFWeR4kSHFIu1WF7q952wEbvP7vGh
X-Received: by 2002:a05:6820:2017:b0:6b7:83d6:2929 with SMTP id 006d021491bc7-6b783d62f60mr11389790eaf.44.1788779066102;
        Mon, 07 Sep 2026 04:04:26 -0700 (PDT)
X-Received: by 2002:a05:6820:2017:b0:6b7:83d6:2929 with SMTP id 006d021491bc7-6b783d62f60mr11389746eaf.44.1788779065713;
        Mon, 07 Sep 2026 04:04:25 -0700 (PDT)
Received: from [192.168.1.11] ([103.211.19.41])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339ac24d7esm43139397eec.15.2026.09.07.04.04.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 04:04:25 -0700 (PDT)
Message-ID: <dcb2f3a1-5fd5-4ffe-974f-4b3801ae3bbd@oss.qualcomm.com>
Date: Mon, 7 Sep 2026 16:34:16 +0530
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/6] dt-bindings: phy: qcom,x1e80100-csi2-phy: Add
 Glymur compatible
To: Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>, Lee Jones <lee@kernel.org>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mfd@lists.linux.dev,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>
References: <20260907-glymur_camss-v2-0-75f7982dc983@oss.qualcomm.com>
 <20260907-glymur_camss-v2-1-75f7982dc983@oss.qualcomm.com>
 <97360c1c-f573-48c5-9917-4bbc34ad394d@oss.qualcomm.com>
Content-Language: en-US
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
In-Reply-To: <97360c1c-f573-48c5-9917-4bbc34ad394d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDEyMSBTYWx0ZWRfXzA7a5flAUbhQ
 lUtV3h+pqWHBVmXNl9Q6bzg5lxT2ZLMSY68BImyFeai24ec1PniBN2BZgQMjvPFALZ7TTTPuZ3n
 6NZ0DuTJbYnUDTHL6B5fKjNBY+0Xykp9BP2KS2iQd338iJmID53UbEvelHCKAUcqzqJS0oqQeRO
 tBXgQggcVRvNB7CNLz/9GxJ3SAQ1SepCiDBfD2+8lriw4b3xNa/uYc8UgXuIlvb39NEMMnRQgAt
 BPg/VqDwm2+6DQr1ZYYhAQ8IkqYgvbF0t+r1QnCq+odXgeKUT9yt0k03gb0jiy4XdcIMhN2enuK
 MIHmJ33Y+WMboEKfgcXxcxTBZoquXeb0bGIECtMSHIj95ErLd9FD6U5aY+W+eorKsOYqkIeDZcw
 BABWi8peO4Lcl7x8GFj3eS5avTf30aNiUL5lvT3mRcrFASdEkJ8AZBCK/TvWu/pjpOxU7AakKHg
 u/i/hKzLJvW6ulZzWbw==
X-Authority-Analysis: v=2.4 cv=MrJiLWae c=1 sm=1 tr=0 ts=6a9e9a3a cx=c_pps
 a=lVi5GcDxkcJcfCmEjVJoaw==:117 a=HcLy/BXbbKFjgnJyaMb84Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=Tf9iwjJDQdcXpSb9m0EA:9 a=QEXdDO2ut3YA:10
 a=rBiNkAWo9uy_4UTK5NWh:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: h8Rl-QhTluyAd8p9YlLy-lcPpRUgcSL7
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDEyMSBTYWx0ZWRfX4d3BJ4898LHa
 1mj1cybKBwIjy44IOUUmlstc/GzAkP74orG0K725LoBLD9Eq+X6biyNWnsbw5msvkEuoHPhc5Lq
 /Ky2lQ3e63g8jv/yjXfrha06jho3D5g=
X-Proofpoint-GUID: h8Rl-QhTluyAd8p9YlLy-lcPpRUgcSL7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_03,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 suspectscore=0 adultscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609070121



On 07-09-2026 16:26, Pankaj Patil wrote:
>> 993271c42fa063a82cb0f6edd41e87b30bc8e109..7ac944974849b99abd982b1544ef39fc32e1f21b 100644
>> --- a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
>> +++ b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
> There is no such file as qcom,x1e80100-csi2-phy.yaml,
> Same was pointed out earlier on another patch,
> https://lore.kernel.org/all/20260722-literate-nondescript-seagull-cbdfaa@quoll/

This patch depends on the CSI2 PHY binding series noted in the cover
letter [1]. The prerequisite is also tracked in the b4 metadata.
The file lands with that series before this one is applied.

[1] https://lore.kernel.org/all/20260903-x1e-csi2-phy-v17-0-26606fa9a039@linaro.org

---
Regards,
Nihal Kumar Gupta
