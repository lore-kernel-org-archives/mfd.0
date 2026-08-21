Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A402D2931F0
	for <mfd@lists.linux.dev>; Fri, 21 Aug 2026 13:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787317209; cv=pass; b=faqgBj/6viR1J2iTTTSIF96huXl0YYCsp4CplFqEuulNR6xzFo4kqrUzx35H7Vf6vx/UX3sNcfAPGOT+GXipiWC75YX6DjhKRtx1URsa7nF9dQbwPArWxOCq3OO4S0RmXEK4+986hDsrLbqpzsjoTzMXwaUXi49jvTCKz9k1oSU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787317209; c=relaxed/simple;
	bh=bbjh+lpl5kSNN0tHfy+Fh32nIkV8RW6mF8Saf7F+QN0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Eg/MLv4tSnxsnay/uJdou+q5Sqey4qWFlxz4sSX+Drz1u6Pld4SD00Nhzu08SdJXpp8AQX2WHlrOniU+rWTsuhkyZSY28aLI25hxLFaN+enHDkbLs/BXziG5ZvU8Kf4F/TDxbnBUG8vx8oTBj4GiewTNQ3Jd4QnBUIm8iQS8ric=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DjLCozDR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IC+CloFd; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DjLCozDR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IC+CloFd"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67LCp9ih2258014
	for <mfd@lists.linux.dev>; Fri, 21 Aug 2026 13:00:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kITj3KNQm/KXIzgVqzqWSiv6WlzVmDA2S/07gwBrxkM=; b=DjLCozDR/JQKfj0I
	LGX+gGc3nt49HwQZ7pisjID9l61OyR9AiXwfdQdk3w2Ih/2NN3h9RQINzcDmM9Wv
	NRu+VJW0CcgX+JtFpDGdkhsJ0TQda3kG9pw1xtf0Xhm6sL/v1SJk+H/yJQnX+q6n
	efNdf6UFF5YAe9aP//A8m871HS+Gvega2RMM9tpn6o5N5TU5JU5BV8SaIBd6hFV0
	kescd85G7izy8x2ojf/KldMlTTXs13DqN+52zcO6zMHat2W/3SF/kmPrBWjI3fLi
	IMu0oZbuJL6A0cZlFEwof59qO/Xfrwmwh5TUHpawHYPuH5Z1b4jt8e8mBJXDxSrc
	GvAM8Q==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g6ecba0u3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <mfd@lists.linux.dev>; Fri, 21 Aug 2026 13:00:02 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cb5cc1e139bso700804a12.3
        for <mfd@lists.linux.dev>; Fri, 21 Aug 2026 06:00:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787317201; cv=none;
        d=google.com; s=arc-20260327;
        b=AxZ5DBk/oqBJXWSz+ceXIldyRUjAgjFbn0iuSN9xMajE9+FlFSz3HWCY5Zt7IcVAHX
         cHQq4XHoKxkWxfFRpoXYYvdBWp4OJntTBIehnT/6Nil3KbfzidvGkRl9avG+sTzIRo8/
         XE2/d2zvizrxqHJsSCN7xQ1dGkR1qB+QqnvksqMoad0xicwXJhKB0wf1e/cAAESihWPJ
         vo91jYTLX0qYkFgubaUMPEZsKhnyBZnUJlYWB4c2n6DhUXSTjH/Rx5ymg8ooUkGmP7Ne
         iyl8LqALh/jwXqhWlr4eL70RZzYZpfxemP4QSq05Y/kfjd6hfIk3AwdJgX2Ymyij8bo3
         rAgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kITj3KNQm/KXIzgVqzqWSiv6WlzVmDA2S/07gwBrxkM=;
        fh=WAstpEP0s5lLXoVsa951GqDF5U5Y98erRMvGlRkTsX0=;
        b=JBf9PGjjX1CYtaZr9VqmLhjjcfwgIAujR6fo4pC58GoRBaJeia4WULTuFU1TI+aFj2
         +qX6wdJCJUSBxjT7ODODClM53cpT5TYK5i6XyEm7pNB325cphXnKR5m+QG6Ccgx0Hyf1
         zLPkBEB/J/Kp3f7oIgrwa3IfRAPVJRRUHowuk1aCSPfKHwZ6wbSfPgOG8S00AzKAl3ww
         zyqROasGE+FrBkdjHqs2ZEeaUJm08DMw41gjdHdBhbo0S2IBeWQk1BWslMI8aqr3foZ4
         wwDHTU/Z98GIuy8ZZaoH81twk0Tl+VYgualaBfAf1i/ainqDSm7Kn4U4/jCE1EgtEhUX
         wmRw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787317201; x=1787922001; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kITj3KNQm/KXIzgVqzqWSiv6WlzVmDA2S/07gwBrxkM=;
        b=IC+CloFdAzceWFKmpQsQpIw2/EeyA3fcQDni3iiWSkL9aj8J4cdUxlG1CyMfelvPph
         1X5BvWsI2CfruRuPvhfgoxSC+R7gX9vrpQoS40Xc2h9OhMlaXdjLic28xHTjzDXFqAh9
         +M2eSfLg+2/IdFKaEOUKwTLK85fm4ENyQUlwPm1CEGie/nfw5SyjWrj+k4MQofH9a7Vv
         MUiKyjTBw9gV0H7qb+uri7yVrLpy41huTmJ8VhSQIyV2Vr6O61jWd7GcEpiVxtgfgoLI
         ulgxb1UyPKbGyyPabTEPGXPPX3s+UXvu7yWzhwb3UL6XDjzHQ2oD9bxb3LZkdS19U05O
         yOZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787317201; x=1787922001;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kITj3KNQm/KXIzgVqzqWSiv6WlzVmDA2S/07gwBrxkM=;
        b=cKklGwJ44B/YkvCmRalSyooxwj4lEwshyvDGyJ9WYz3ariR7UUpn6oyBASa+cnU2Nq
         FWl8TrI/OEtTqiigdf2fSu2DZBJwAFImKt5PaR5SQs32gJU3PfTLhh4+G3Om87m4cJWO
         ZWN5+TNMY8uNWuG4WjLqJA+A4RkbwGTGM+EpqBTiylKbxV6nW8qA8bYTsG2NfIhD1yK2
         P9Mh/NErnfK8lfKKgOE8i+1koG7yQAjAi6idRjrQaeeF0iQIYur+YikfpoxWmOpG5y5M
         mp4ODoeQTO3qGTnOiGmU9ZdX517VBr5oktS5dtZRs9P47HdvyiLDxuD/qanzHIbpTVfv
         ROmw==
X-Forwarded-Encrypted: i=1; AHgh+RqCQQEqACckky7YH1QHpWk9D57Gwl7KVT8/GgktRlnKxUyzK1LiGJWezZGqHg/wLboTAso=@lists.linux.dev
X-Gm-Message-State: AOJu0YyUMoVkx6lAuHbt75pW/ReYTol8ZL2hDeLiuyJqnzR9ke2lCPSM
	0HIxcC5+Zg28OW5snwJf5PZjPjTNdQRNK6Vu5nh7IaMz81WCfukdltDAelLhEMunm8Bp5OKz8c4
	NM9zpXugl0QnWJXhGWzZ1DKG5+MKQ3xVhWhUo1lAFa2cwUH2Tq0FnKH6E5mLiz6hrbK5KTVpZ24
	p0b8F64Py89gGzELS4PEziyg7xlULfhg==
X-Gm-Gg: AR+sD10Obt8vdZUejyeWJWfCKzN+DH7iAK9jfwK6hC0Zv2w11MWQ9QMdoStuy9mkIhl
	kfV+BZbzqdE1JI+r0v1j3Bz2EKjrXcc33N0Up9a/I0l+Kig1DqXXnDsDuK2u/ukcLy9YlZAp9dw
	+DAAH383Asypbp9FUJNgALSYB2v4DIDHdpWVpUFpWadQ4K5JXxh9VRi4+ugg==
X-Received: by 2002:a05:6a21:6e8a:b0:3cc:51ff:c2e7 with SMTP id adf61e73a8af0-3cd3000a327mr12362747637.10.1787317200913;
        Fri, 21 Aug 2026 06:00:00 -0700 (PDT)
X-Received: by 2002:a05:6a21:6e8a:b0:3cc:51ff:c2e7 with SMTP id
 adf61e73a8af0-3cd3000a327mr12362636637.10.1787317200300; Fri, 21 Aug 2026
 06:00:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260803-arm-psci-system_reset2-vendor-reboots-v24-0-889281373870@oss.qualcomm.com>
 <20260803-arm-psci-system_reset2-vendor-reboots-v24-4-889281373870@oss.qualcomm.com>
In-Reply-To: <20260803-arm-psci-system_reset2-vendor-reboots-v24-4-889281373870@oss.qualcomm.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Fri, 21 Aug 2026 14:59:49 +0200
X-Gm-Features: AcwNN1UMCNjGyQAbzmHsbeA8xY1dFu-8Er3YSHHLgMxcyqihdxWW5Lbpb1PS4Wo
Message-ID: <CAPx+jO9QE_KG8BbfnMLTebDpGDj7OSpPDtgc9uTBGZCDJeLu_w@mail.gmail.com>
Subject: Re: [PATCH v24 04/12] mfd: psci-mfd: Add PSCI MFD driver for
 cpuidle-psci-domain cell
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
        Bartosz Golaszewski <brgl@kernel.org>,
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIxMDA5OSBTYWx0ZWRfX0oIy2oPhK/Wi
 AizHzLzNrHdL4GklWGj1YkjQ3Gg0e3ZyJaTZvD0QrkCTt8TOU7Htd2m2LLMnwp3YJOUzvGQeS9I
 8w7CyTZNj6r6RILbxkF8b7N4dC+CQ9/UN0eXMtNNElaZoaqqkqIHVADHR636JJB9sQsNhnqz+9u
 lPWVYcdX0T5jvHS6a4o4BgacgR7q/hwb+ytewINR1fLrtWjnTfcpGvoT3R756e12pjIJ7S71Spx
 XuVdSzZegt7kJ/lFU/EuEmG+O/g2tsG7r/7RVYhtJSyT6wOA7j9vzvx6hO/nwBVEmkmw80YPwFW
 tsWb/Qq2hsu0hgS1qffpzfWtqU+g8RRKUwhlcOncsiW0WCMkbYDHnijndkNfdfM/9k0m2tBueMQ
 3ugAbtwVkqn7s+csZ2L5KiKTVcYmNabqSCsV9Qk4D1MUS5Qv/TOM5xsWurTBDbJxicZ4MZOnga8
 jtDcqW51jyfQYqIpFfQ==
X-Authority-Analysis: v=2.4 cv=e/s2j6p/ c=1 sm=1 tr=0 ts=6a884bd2 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8 a=JfrnYn6hAAAA:8
 a=26vBHaLJDQanIZDXMEMA:9 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-GUID: 05tijNXgPqOjjlekyXrbpYasUY6Xomqa
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIxMDA5OSBTYWx0ZWRfX26ObwekArg5e
 e4O0JBuV5SYDDqYrsnG5BUblvgWpOU+kwWJaJYfMK5nQQdVKo33CWZMEuWjujTVb/E75NeXtEFm
 Fd9qbCsiCGO3iv4mTQ0OdVtOF2AspCc=
X-Proofpoint-ORIG-GUID: 05tijNXgPqOjjlekyXrbpYasUY6Xomqa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-21_04,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 suspectscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 priorityscore=1501
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608210099

On Mon, Aug 3, 2026 at 11:45=E2=80=AFAM Shivendra Pratap
<shivendra.pratap@oss.qualcomm.com> wrote:
>
> PSCI has multiple kernel consumers, such as cpuidle-psci-domain.
> Currently, both the PSCI core driver and cpuidle-psci-domain bind
> directly to the same PSCI node "arm,psci-1.0". Additional consumers, if
> introduced, would also need to bind in the same way, leading to several
> drivers attached to a single device node.
>
> Introduce a PSCI MFD driver that binds to "arm,psci-1.0" and registers
> PSCI child cells. As the first user, register cpuidle-psci-domain as a
> child cell.

I don't think PSCI should be modeled as an MFD device with childrens.

Instead, this looks rather like a better fit for the auxiliary
bus/driver. Please consider using that instead.

Kind regards
Uffe

>
> Update cpuidle-psci-domain to probe as an MFD child and use the parent
> PSCI node for power-domain traversal.
>
> Suggested-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
> ---
>  MAINTAINERS                           |  1 +
>  drivers/cpuidle/Kconfig.arm           |  1 +
>  drivers/cpuidle/cpuidle-psci-domain.c |  9 +-------
>  drivers/mfd/Kconfig                   | 12 ++++++++++
>  drivers/mfd/Makefile                  |  2 ++
>  drivers/mfd/psci-mfd.c                | 43 +++++++++++++++++++++++++++++=
++++++
>  6 files changed, 60 insertions(+), 8 deletions(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index fe67f7bfa44c..0b6e4f89f319 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -21671,6 +21671,7 @@ L:      linux-arm-kernel@lists.infradead.org (mod=
erated for non-subscribers)
>  S:     Maintained
>  F:     Documentation/devicetree/bindings/arm/psci.yaml
>  F:     drivers/firmware/psci/
> +F:     drivers/mfd/psci-mfd.c
>  F:     include/linux/psci.h
>  F:     include/uapi/linux/psci.h
>
> diff --git a/drivers/cpuidle/Kconfig.arm b/drivers/cpuidle/Kconfig.arm
> index b88b01aa5829..c5ecca0d7397 100644
> --- a/drivers/cpuidle/Kconfig.arm
> +++ b/drivers/cpuidle/Kconfig.arm
> @@ -36,6 +36,7 @@ config ARM_PSCI_CPUIDLE_DOMAIN
>         bool "PSCI CPU idle Domain"
>         depends on ARM_PSCI_CPUIDLE
>         depends on PM_GENERIC_DOMAINS_OF
> +       depends on MFD_PSCI
>         select DT_IDLE_GENPD
>         default y
>         help
> diff --git a/drivers/cpuidle/cpuidle-psci-domain.c b/drivers/cpuidle/cpui=
dle-psci-domain.c
> index b9e4ad7d43a3..a2d01810f295 100644
> --- a/drivers/cpuidle/cpuidle-psci-domain.c
> +++ b/drivers/cpuidle/cpuidle-psci-domain.c
> @@ -17,7 +17,6 @@
>  #include <linux/pm_runtime.h>
>  #include <linux/psci.h>
>  #include <linux/slab.h>
> -#include <linux/string.h>
>
>  #include "cpuidle-psci.h"
>  #include "dt_idle_genpd.h"
> @@ -122,14 +121,9 @@ static void psci_pd_remove(void)
>         }
>  }
>
> -static const struct of_device_id psci_of_match[] =3D {
> -       { .compatible =3D "arm,psci-1.0" },
> -       {}
> -};
> -
>  static int psci_cpuidle_domain_probe(struct platform_device *pdev)
>  {
> -       struct device_node *np =3D pdev->dev.of_node;
> +       struct device_node *np =3D pdev->dev.parent->of_node;
>         bool use_osi =3D psci_has_osi_support();
>         int ret =3D 0, pd_count =3D 0;
>
> @@ -181,7 +175,6 @@ static struct platform_driver psci_cpuidle_domain_dri=
ver =3D {
>         .probe  =3D psci_cpuidle_domain_probe,
>         .driver =3D {
>                 .name =3D "psci-cpuidle-domain",
> -               .of_match_table =3D psci_of_match,
>         },
>  };
>
> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> index e4fd4572472f..d18655d76172 100644
> --- a/drivers/mfd/Kconfig
> +++ b/drivers/mfd/Kconfig
> @@ -2374,6 +2374,18 @@ config MFD_KHADAS_MCU
>           additional drivers must be enabled in order to use the function=
ality
>           of the device.
>
> +config MFD_PSCI
> +       bool "PSCI MFD for psci child cells"
> +       depends on ARM_PSCI_FW
> +       depends on OF
> +       select MFD_CORE
> +       default y
> +       help
> +         PSCI MFD registers PSCI child cells and exposes them as
> +         platform devices. Child drivers are probed only if enabled in t=
he
> +         kernel configuration. Select this option whenever a supported P=
SCI
> +         child driver is selected.
> +
>  config MFD_ACER_A500_EC
>         tristate "Support for Acer Iconia Tab A500 Embedded Controller"
>         depends on I2C
> diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
> index 72d3944b0ad8..f3edfad702ff 100644
> --- a/drivers/mfd/Makefile
> +++ b/drivers/mfd/Makefile
> @@ -24,6 +24,8 @@ obj-$(CONFIG_MFD_EXYNOS_LPASS)        +=3D exynos-lpass=
.o
>  obj-$(CONFIG_MFD_GATEWORKS_GSC)        +=3D gateworks-gsc.o
>  obj-$(CONFIG_MFD_MACSMC)       +=3D macsmc.o
>
> +obj-$(CONFIG_MFD_PSCI)         +=3D psci-mfd.o
> +
>  obj-$(CONFIG_MFD_TI_LP873X)    +=3D lp873x.o
>  obj-$(CONFIG_MFD_TI_LP87565)   +=3D lp87565.o
>  obj-$(CONFIG_MFD_TI_AM335X_TSCADC)     +=3D ti_am335x_tscadc.o
> diff --git a/drivers/mfd/psci-mfd.c b/drivers/mfd/psci-mfd.c
> new file mode 100644
> index 000000000000..7affd6bb09dd
> --- /dev/null
> +++ b/drivers/mfd/psci-mfd.c
> @@ -0,0 +1,43 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#include <linux/mfd/core.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +
> +static const struct mfd_cell psci_cells[] =3D {
> +       {
> +               .name =3D "psci-cpuidle-domain",
> +       },
> +};
> +
> +static int psci_mfd_probe(struct platform_device *pdev)
> +{
> +       return devm_mfd_add_devices(&pdev->dev, PLATFORM_DEVID_AUTO, psci=
_cells,
> +                                  ARRAY_SIZE(psci_cells), NULL, 0, NULL)=
;
> +}
> +
> +static const struct of_device_id psci_mfd_of_match[] =3D {
> +       { .compatible =3D "arm,psci-1.0" },
> +       { }
> +};
> +
> +static struct platform_driver psci_mfd_driver =3D {
> +       .probe =3D psci_mfd_probe,
> +       .driver =3D {
> +               .name =3D "psci-mfd",
> +               .of_match_table =3D psci_mfd_of_match,
> +       },
> +};
> +
> +static int __init psci_mfd_init(void)
> +{
> +       return platform_driver_register(&psci_mfd_driver);
> +}
> +
> +core_initcall(psci_mfd_init);
> +
> +MODULE_LICENSE("GPL");
>
> --
> 2.34.1
>
